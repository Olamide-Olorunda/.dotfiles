return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    branch = "main", -- fix for deprecated functions coming in nvim 0.13
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        "hrsh7th/cmp-cmdline",
        "f3fora/cmp-spell",
        {
            "L3MON4D3/LuaSnip",
            -- follow latest release.
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- autocompletion
        "rafamadriz/friendly-snippets", -- snippets
        "nvim-treesitter/nvim-treesitter",
        "onsails/lspkind.nvim", -- vs-code pictograms
    },
    config = function()
      local cmp = require("cmp")
        -- local luasnip = require("luasnip")
      local has_luasnip, luasnip = pcall(require, 'luasnip')
      local lspkind = require("lspkind")

      local rhs = function(keys)
          return vim.api.nvim_replace_termcodes(keys, true, true, true)
      end

      local lsp_kinds = {
          Class = ' ',
          Color = ' ',
          Constant = ' ',
          Constructor = ' ',
          Enum = ' ',
          EnumMember = ' ',
          Event = ' ',
          Field = ' ',
          File = ' ',
          Folder = ' ',
          Function = ' ',
          Interface = ' ',
          Keyword = ' ',
          Method = ' ',
          Module = ' ',
            Operator = ' ',
            Property = ' ',
            Reference = ' ',
            Snippet = ' ',
            Struct = ' ',
            Text = ' ',
            TypeParameter = ' ',
            Unit = ' ',
            Value = ' ',
            Variable = ' ',
        }


