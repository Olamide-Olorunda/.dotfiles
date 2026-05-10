return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            -- We keep this clean and default. It automatically detects 
            -- your Rose Pine theme and colors the signs perfectly to match.
            signcolumn = true,
            numhl      = false,
            linehl     = false,
            word_diff  = false,
            watch_gitdir = {
                follow_files = true
            },
            auto_attach = true,
            attach_to_untracked = true,
            current_line_blame = false, -- Turn this to 'true' if you want VSCode style inline git blame!
        })
    end
}
