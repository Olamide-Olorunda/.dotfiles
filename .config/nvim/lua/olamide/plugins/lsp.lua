return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim",                   opts = {} },
  },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip').filetype_extend('javascriptreact', { 'javascript', 'html' })

    local lsp = require('lsp-zero')

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    local qt_clangd_flag_pattern = "^Unknown argument:%s*['\"]?%-mno%-direct%-extern%-access['\"]?"
    local default_publish_diagnostics = vim.lsp.handlers["textDocument/publishDiagnostics"]
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      local client = ctx and vim.lsp.get_client_by_id(ctx.client_id)
      if client and client.name == "clangd" and result and result.diagnostics then
        result = vim.deepcopy(result)
        result.diagnostics = vim.tbl_filter(function(diagnostic)
          local message = diagnostic.message or ""
          return not message:match(qt_clangd_flag_pattern)
        end, result.diagnostics)
      end
      return default_publish_diagnostics(err, result, ctx, config)
    end

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, silent = true }
      local keymap = vim.keymap

      if client.server_capabilities.semanticTokensProvider then
        client.server_capabilities.semanticTokensProvider = nil
      end

      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      opts.desc = "Go to definition"
      keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      opts.desc = "Show documentation under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)
      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

      local ft = vim.bo[bufnr].filetype
      local path = vim.api.nvim_buf_get_name(bufnr)
      local disable_inlay_hints = vim.tbl_contains({ "c", "cpp", "objc", "objcpp" }, ft)
          or path:match("%.h$") or path:match("%.hh$") or path:match("%.hpp$")
          or path:match("%.hxx$") or path:match("%.inl$")

      if client.server_capabilities.inlayHintProvider and not disable_inlay_hints then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'pyright', 'ts_ls', 'clangd', 'lua_ls', 'tailwindcss', 'eslint',
        'html', 'cssls', 'jsonls', 'tinymist', 'rust_analyzer', 'gopls' -- Added gopls and rust
      },
      handlers = {
        lsp.default_setup,
        -- Clangd specific setup
        clangd = function()
          require('lspconfig').clangd.setup({
            cmd = {
              "clangd",
              "--background-index",
              "--clang-tidy",
              "--query-driver=/usr/bin/c++,/usr/bin/g++",
            },
            init_options = {
              fallbackFlags = { "-std=c++20" },
            },
          })
        end,

        -- Lua specific setup
        lua_ls = function()
          require('lspconfig').lua_ls.setup({
            settings = {
              Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = { globals = { "vim" } },
                workspace = {
                  checkThirdParty = false,
                  library = vim.api.nvim_get_runtime_file("", true),
                },
                completion = { callSnippet = "Replace" },
              },
            },
          })
        end,

        -- Rust specific setup
        rust_analyzer = function()
          require('lspconfig').rust_analyzer.setup({
            settings = {
              ["rust-analyzer"] = {
                inlayHints = {
                  typeHints = { enable = true },
                  parameterHints = { enable = false },
                  chainingHints = { enable = false },
                  bindingModeHints = { enable = false },
                  closureReturnTypeHints = { enable = "never" },
                  lifetimeElisionHints = { enable = "never" },
                  reborrowHints = { enable = false },
                  closingBraceHints = { enable = false },
                },
              },
            },
          })
        end,
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(ev)
        local ft = vim.bo[ev.buf].filetype
        local cpp_like = vim.tbl_contains({ "c", "cpp", "objc", "objcpp" }, ft)

        if ft == "typst" then
          local has_conform, conform = pcall(require, "conform")
          if has_conform then
            conform.format({ bufnr = ev.buf })
          end
          return
        end

        if cpp_like then
          vim.lsp.buf.format({
            bufnr = ev.buf,
            async = false,
            filter = function(client)
              return client.name == "clangd"
            end,
          })
        end
      end,
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-e>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      sources = {
        { name = 'lazydev', group_index = 0 },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }
    })
  end
}
