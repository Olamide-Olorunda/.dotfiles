return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local custom_gruvbox = require('lualine.themes.gruvbox-material')

        local modes = { 'normal', 'insert', 'visual', 'replace', 'command' }
        for _, mode in ipairs(modes) do
            if custom_gruvbox[mode] and custom_gruvbox[mode].c then
                custom_gruvbox[mode].c.bg = 'NONE'
            end
        end

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
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
        })
    end
}
