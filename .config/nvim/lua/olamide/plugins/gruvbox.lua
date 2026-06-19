return {
  "sainnhe/gruvbox-material",
  lazy = false,
  enabled = false,
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_transparent_background = 1
    vim.g.gruvbox_material_foreground = 'material'
    vim.cmd.colorscheme('gruvbox-material')
  end,
}
