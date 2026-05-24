return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      signcolumn          = true,
      numhl               = false,
      linehl              = false,
      word_diff           = false,
      watch_gitdir        = {
        follow_files = true
      },
      auto_attach         = true,
      attach_to_untracked = true,
      current_line_blame  = true,
    })
  end
}
