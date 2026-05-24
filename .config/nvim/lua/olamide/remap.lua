vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle when jumping half-pages
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over something without losing what you copied
vim.keymap.set("x", "<leader>p", [["_dP]])

-- System clipboard sync
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Escape with Ctrl-c
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Undo directory (fixed)
vim.opt.undofile = false

-- ---------------------------------------------------------------------
-- The Universal Code Runner
-- ---------------------------------------------------------------------
vim.keymap.set("n", "<leader>r", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p")   -- full path
  local no_ext = vim.fn.expand("%:p:r")

  local cmd = ""
  if ft == "python" then
    cmd = "python3 " .. file
  elseif ft == "javascript" then
    cmd = "node " .. file
  elseif ft == "cpp" then
    cmd = "clang++ -std=c++17 " .. file .. " -o " .. no_ext .. " && " .. no_ext
  elseif ft == "c" then
    cmd = "clang " .. file .. " -o " .. no_ext .. " && " .. no_ext
  elseif ft == "lua" then
    cmd = "lua " .. file
  else
    vim.notify("No run command for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  -- Save first (without undo complications)

  -- Run in a bottom split terminal
  vim.cmd("botright split")
  vim.cmd("resize 15")
  vim.cmd("term " .. cmd)
  vim.cmd("startinsert")
end, { desc = "Run current file" })

-- Exit terminal mode with Escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
