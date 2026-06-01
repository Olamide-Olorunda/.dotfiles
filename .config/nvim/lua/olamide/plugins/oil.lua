return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = false,
  },
  -- Define your keyboard shortcut here
  keys = {
    { "<leader>e", "<CMD>Oil<CR>", desc = "Open Oil file explorer in current directory" },
  },
  lazy = false,
  init = function()
    -- Ensure netrw commands like :Ex, :Sex, and :Vex don't break or conflict
    vim.api.nvim_create_user_command('Ex', 'Explore', {})
    vim.api.nvim_create_user_command('Sex', 'Sexplore', {})
    vim.api.nvim_create_user_command('Vex', 'Vexplore', {})
  end,
}
