return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- Enable treesitter integration if you add it later
            disable_filetype = { "TelescopePrompt" }, -- Don't mess with Telescope search
        })
    end,
}
