vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- The "Primeagen Specials"
-- Move selected lines up and down in visual mode (Life-changing for refactoring JS/Python)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle when jumping half-pages (Prevents losing your spot)
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- The "Greatest Remap Ever": Paste over something without losing what you copied
vim.keymap.set("x", "<leader>p", [["_dP]])

-- System clipboard sync (Copy to Mac clipboard so you can paste in Firefox/Obsidian)
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register (Doesn't overwrite your copy buffer)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Escape with Ctrl-c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Q (The most annoying key in Vim)
vim.keymap.set("n", "Q", "<nop>")

-- ---------------------------------------------------------------------
-- The Universal Code Runner
-- ---------------------------------------------------------------------
-- Space + r: Detects the filetype, compiles if necessary, and runs it in a split terminal.
vim.keymap.set("n", "<leader>r", function()
    -- 1. Automatically save the file before running
    vim.cmd("w")

    -- 2. Get information about the current file
    local ft = vim.bo.filetype       -- e.g., "python", "cpp"
    local file = vim.fn.expand("%")  -- e.g., "main.cpp"
    local no_ext = vim.fn.expand("%<") -- e.g., "main"

    -- 3. Determine the terminal command based on the language
    local cmd = ""
    if ft == "python" then
        cmd = "python3 " .. file
    elseif ft == "javascript" then
        cmd = "node " .. file
    elseif ft == "cpp" then
        -- Uses clang++ (macOS native) to compile and instantly run the binary
        cmd = "clang++ -std=c++17 " .. file .. " -o " .. no_ext .. " && ./" .. no_ext
    elseif ft == "c" then
        cmd = "clang " .. file .. " -o " .. no_ext .. " && ./" .. no_ext
    elseif ft == "lua" then
        cmd = "lua " .. file
    else
        vim.notify("No run command configured for filetype: " .. ft, vim.log.levels.WARN)
        return
    end

    -- 4. Execute the command in a new split window
    -- Open split
    vim.cmd("split")
    -- Move cursor to the new split
    vim.cmd("wincmd j")
    -- Open the terminal and run the command
    vim.cmd("term " .. cmd)
    -- Drop into insert mode automatically so you can type if your program requires user input
    vim.cmd("startinsert")
end, { desc = "Run current file" })

-- Easily exit terminal mode with 'Escape'
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
