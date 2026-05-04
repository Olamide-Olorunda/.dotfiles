return {
    "nvim-lualine/lualine.nvim",
    -- Web Devicons gives the status bar those little folder and language logos
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'gruvbox-material', -- Forces the bar to match our colorscheme
                icons_enabled = true,
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_a = { 'mode' },
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
