return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')

        -- Search for files by name
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        -- Search for files tracked by git
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        -- Search for specific text in files using grep
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        -- help page: see all available telescope commands
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        -- to search for folders only 
        vim.keymap.set('n', '<leader>fd', function()
            require('telescope.builtin').find_files({
                prompt_title = "Browse Folders",
                find_command = { "fd", "--type", "d", "--hidden", "--exclude", ".git" }
            })
        end, { desc = "Telescope: Search for folders only" })
    end
}
