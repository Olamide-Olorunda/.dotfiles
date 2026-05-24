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
  },
  config = function()
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip').filetype_extend('javascriptreact', { 'javascript', 'html' })
    local lsp = require('lsp-zero')

    lsp.on_attach(function(client, bufnr)
      -- K: Hover to see documentation
      -- gd: Go to definition
      -- [d / ]d: Jump to next/previous error
      lsp.default_keymaps({ buffer = bufnr })
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = { 'pyright', 'ts_ls', 'clangd', 'lua_ls', 'tailwindcss', 'eslint', 'html', 'cssls', 'jsonls' },
      handlers = {
        lsp.default_setup,
      },
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      })
    })
  end
}
