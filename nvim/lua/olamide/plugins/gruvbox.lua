return {
    "sainnhe/gruvbox-material",
    lazy = false,    -- We want the theme to load immediately on startup
    priority = 1000, -- Force it to load before all other plugins
    config = function()
        -- Set contrast to 'hard' for that deep charcoal look
        vim.g.gruvbox_material_background = 'hard'
        -- Use the original material color palette
        vim.g.gruvbox_material_foreground = 'material'
        
        -- Apply the theme
        vim.cmd.colorscheme('gruvbox-material')
    end,
}
