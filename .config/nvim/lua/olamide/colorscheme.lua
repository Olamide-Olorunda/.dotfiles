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

  -- accents (muted, desaturated to match the obsidian look)
  red = "#ff2e2e",        -- links / errors (kept from your original)
  rose = "#cf9b9b",       -- constants / booleans
  gold = "#d9b878",       -- types
  sage = "#a3c9a8",       -- strings
  slate_blue = "#7ea6c9", -- functions
  mauve = "#b19cd9",      -- keywords / statements
  clay = "#d98f6f",       -- numbers
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
  String = { fg = colors.sage },
  Number = { fg = colors.clay },
  Boolean = { fg = colors.rose, bold = true },
  Keyword = { fg = colors.mauve, bold = true },
  Statement = { fg = colors.mauve, bold = true },
  Conditional = { fg = colors.mauve, bold = true },
  Function = { fg = colors.slate_blue },
  Identifier = { fg = colors.fg },
  Constant = { fg = colors.rose, bold = true },
  Type = { fg = colors.gold, bold = true },
  Operator = { fg = colors.light_grey },
  Underlined = { fg = colors.red, underline = true },
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
