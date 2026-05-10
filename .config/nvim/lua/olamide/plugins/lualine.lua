return {
    "nvim-lualine/lualine.nvim",
    -- Web Devicons gives the status bar those little folder and language logos
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local custom_gruvbox = require('lualine.themes.gruvbox-material')

        custom_gruvbox.normal.c.bg = 'NONE'
        custom_gruvbox.insert.c.bg = 'NONE'
        custom_gruvbox.visual.c.bg = 'NONE'
        custom_gruvbox.replace.c.bg = 'NONE'
        custom_gruvbox.command.c.bg = 'NONE'


        require('lualine').setup({
            options = {
                theme = custom_gruvbox,
                icons_enabled = true,
                component_separators = { left = '|', right = '|' },
                section_separators = '',
                globalstatus = true,
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                -- Shows exactly what language server is currently running
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        })
    end
}
