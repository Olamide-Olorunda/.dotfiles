vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "obsidian_trans"

local colors = {
  bg = "NONE",             -- CRITICAL: Keeps your Ghostty transparency intact
  fg = "#e0e0e0",          -- Main text color
  white = "#ffffff",       -- Bright white for headers/highlights
  grey = "#888888",        -- Comments and muted items
  dark_grey = "#333333",   -- UI borders and line numbers
  obsidian_red = "#ff2e2e" -- The sharp red link accent from your screenshot
}

local highlights = {
  -- Core UI (Preserving Transparency)
  Normal = { fg = colors.fg, bg = colors.bg },
  NormalFloat = { fg = colors.fg, bg = colors.bg },
  LineNr = { fg = colors.dark_grey, bg = colors.bg },
  CursorLine = { bg = "#1a1a1a" }, -- Very subtle dark row highlight
  CursorLineNr = { fg = colors.white, bg = colors.bg, bold = true },
  VertSplit = { fg = colors.dark_grey, bg = colors.bg },
  SignColumn = { bg = colors.bg },

  -- Minimalist Code/Text Syntax
  Comment = { fg = colors.grey, italic = true },
  String = { fg = colors.fg },
  Number = { fg = colors.white },
  Boolean = { fg = colors.white, bold = true },
  Keyword = { fg = colors.white, bold = true },
  Statement = { fg = colors.white, bold = true },
  Conditional = { fg = colors.white, bold = true },
  Function = { fg = colors.white },
  Identifier = { fg = colors.fg },
  Constant = { fg = colors.white, bold = true },
  Type = { fg = colors.white, bold = true },
  Operator = { fg = colors.fg },

  -- Obsidian Red Accent for Links (Matching Screenshot 2026-06-22 at 16.45.50.jpg)
  Underlined = { fg = colors.obsidian_red, underline = true },
  Directory = { fg = colors.white, bold = true }, -- For netrw/file trees

  -- Popups and Search
  Pmenu = { fg = colors.fg, bg = "#161616" },
  PmenuSel = { fg = colors.bg, bg = colors.white },
  Search = { fg = colors.bg, bg = colors.white },
  IncSearch = { fg = colors.bg, bg = colors.white },
  MatchParen = { fg = colors.white, bg = colors.dark_grey, bold = true },
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

  -- Target URLs and Markdown links specifically to turn them Obsidian Red
  ["@text.uri"] = "Underlined",
  ["@text.reference"] = "Underlined",
  ["markdownUrl"] = "Underlined",
  ["htmlLink"] = "Underlined",
}

for newgroup, oldgroup in pairs(links) do
  vim.api.nvim_set_hl(0, newgroup, { link = oldgroup })
end
