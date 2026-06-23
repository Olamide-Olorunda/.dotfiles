vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "obsidian_trans"

local colors = {
  bg = "NONE",
  fg = "#e0e0e0",
  white = "#ffffff",
  light_grey = "#aaaaaa",
  grey = "#666666",
  dark_grey = "#333333",
  highlight = "#2b2b2b",
  obsidian_red = "#ff2e2e"
}

local highlights = {
  Normal = { fg = colors.fg, bg = colors.bg },
  NormalFloat = { fg = colors.fg, bg = colors.bg },
  LineNr = { fg = colors.grey, bg = colors.bg },
  CursorLine = { bg = colors.highlight },
  CursorLineNr = { fg = colors.white, bg = colors.bg, bold = true },
  VertSplit = { fg = colors.dark_grey, bg = colors.bg },
  SignColumn = { bg = colors.bg },

  Visual = { bg = "#444444" },
  Search = { fg = colors.white, bg = "#555555", bold = true },
  IncSearch = { fg = colors.white, bg = "#777777", bold = true },
  MatchParen = { fg = colors.white, bg = colors.highlight, bold = true, underline = true },

  Comment = { fg = colors.grey, italic = true },
  String = { fg = colors.light_grey },
  Number = { fg = colors.white },
  Boolean = { fg = colors.white, bold = true },
  Keyword = { fg = colors.white, bold = true },
  Statement = { fg = colors.white, bold = true },
  Conditional = { fg = colors.white, bold = true },
  Function = { fg = colors.white },
  Identifier = { fg = colors.fg },
  Constant = { fg = colors.white, bold = true },
  Type = { fg = colors.white, bold = true },
  Operator = { fg = colors.light_grey },

  Underlined = { fg = colors.obsidian_red, underline = true },
  Directory = { fg = colors.white, bold = true },

  Pmenu = { fg = colors.fg, bg = "#161616" },
  PmenuSel = { fg = "#000000", bg = colors.white },
}

for group, styles in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, styles)
end

local links = {
  ["@variable"] = "Identifier",
  ["@function"] = "Function",
  ["@keyword"] = "Keyword",
  ["@string"] = "String",
  ["@comment"] = "Comment",
  ["@type"] = "Type",
  ["@operator"] = "Operator",
  ["@number"] = "Number",
  ["@boolean"] = "Boolean",
  ["@property"] = "Identifier",
  ["@parameter"] = "Identifier",

  ["@text.uri"] = "Underlined",
  ["@text.reference"] = "Underlined",
  ["markdownUrl"] = "Underlined",
  ["htmlLink"] = "Underlined",
}

for newgroup, oldgroup in pairs(links) do
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup })
end
