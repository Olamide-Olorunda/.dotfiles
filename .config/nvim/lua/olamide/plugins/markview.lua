return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  dependencies = { "stevearc/conform.nvim" },
  config = function()
    require("markview").setup({
      code_blocks = {
        style = "simple",
      }
    })

    local monochrome_highlights = {
      MarkviewCode = { bg = "NONE", fg = "#e0e0e0" },
      MarkviewInlineCode = { bg = "NONE", fg = "#ffffff", bold = true },
      MarkviewHeading1 = { bg = "NONE", fg = "#ffffff", bold = true },
      MarkviewHeading2 = { bg = "NONE", fg = "#ffffff", bold = true },
      MarkviewHeading3 = { bg = "NONE", fg = "#ffffff", bold = true },
      MarkviewHeading4 = { bg = "NONE", fg = "#ffffff", bold = true },
      MarkviewHeading5 = { bg = "NONE", fg = "#ffffff", bold = true },
      MarkviewHeading6 = { bg = "NONE", fg = "#ffffff", bold = true },
      MarkviewBlockQuote = { bg = "NONE", fg = "#888888", italic = true },
      MarkviewCheckboxChecked = { bg = "NONE", fg = "#ffffff" },
      MarkviewCheckboxUnchecked = { bg = "NONE", fg = "#888888" },
    }

    for group, styles in pairs(monochrome_highlights) do
      vim.api.nvim_set_hl(0, group, styles)
    end
  end
}
