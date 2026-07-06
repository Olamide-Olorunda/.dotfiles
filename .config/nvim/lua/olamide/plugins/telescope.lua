return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    telescope.setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        }
      }
    })

    -- safely load the extensions
    pcall(telescope.load_extension, 'fzf')
    pcall(telescope.load_extension, 'ui-select')

    vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope: Find files" })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope: Git files" })
    vim.keymap.set('n', '<leader>ps', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "Telescope: Grep string" })
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Telescope: Help tags" })
    vim.keymap.set('n', '<leader>fd', function()
      builtin.find_files({
        prompt_title = "Browse Folders",
        find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" }
      })
    end, { desc = "Telescope: Search for folders only" })

    -- added for C/C++/Go Workflows
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope: Live grep across project folder.' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Telescope: Grep word directly under cursor' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope: Find all open buffers' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Telescope: In-Workspace diagnostics' })
  end
}
