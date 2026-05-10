return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function() 
        -- pcall (protected call) prevents the red screen of death
        local status_ok, configs = pcall(require, "nvim-treesitter.configs")
        if not status_ok then
            vim.notify("Treesitter not loaded yet. Run :Lazy sync", vim.log.levels.WARN)
            return
        end

        configs.setup({
            ensure_installed = { 
                "c", "cpp", "lua", "python", "javascript", "typescript", "html", "css" 
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
