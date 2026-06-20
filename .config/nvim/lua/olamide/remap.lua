vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over something without losing what you copied
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

vim.opt.undofile = true

-- typst preview with telescope ui.
vim.keymap.set('n', '<leader>te', function()
  local formats = { "html", "svg", "png", "pdf" }
  vim.ui.select(formats, {
    prompt = "Select Export Format",
  }, function(choice)
    if not choice then return end
    local command_name = "tinymist.export" .. choice:sub(1, 1):upper() .. choice:sub(2)

    local clients = vim.lsp.get_clients({ bufnr = 0, name = "tinymist" })

    if #clients == 0 then
      vim.notify("tinymist lsp is not attached.", vim.log.levels.ERROR)
      return
    end

    clients[1]:exec_cmd({
      command = command_name,
      arguments = { vim.api.nvim_buf_get_name(0) }
    }, { bufnr = 0 })
  end)
end, { desc = "Typst: Select Export Format" })

vim.keymap.set("n", "<leader>tp", ":TypstPreview<CR>", { desc = "Typst: Start Live Preview" })

vim.keymap.set("n", "<leader>ts", ":TypstPreviewStop<CR>", { desc = "Typst: Stop Live Preview" })

-- Typst + Zathura Live Preview
vim.keymap.set("n", "<leader>tz", function()
  local typst_file = vim.fn.expand("%:p")
  local pdf_file = vim.fn.expand("%:p:r") .. ".pdf"

  os.execute("typst compile " .. typst_file)

  vim.fn.jobstart({ "typst", "watch", typst_file })

  vim.fn.jobstart({ "zathura", pdf_file })

  vim.notify("Typst Watcher & Zathura Started!", vim.log.levels.INFO)
end, { desc = "Typst: Zathura Live Preview" })
-- the universal code runner
vim.keymap.set("n", "<leader>r", function()
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%:p") -- full path
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
  elseif ft == "typst" then
    cmd = "typst compile " .. file
  else
    vim.notify("No run command for filetype: " .. ft, vim.log.levels.WARN)
    return
  end

  vim.cmd("silent! write")
  vim.cmd("botright split")
  vim.cmd("resize 15")
  vim.cmd("term " .. cmd)
  vim.cmd("startinsert")
end, { desc = "Run current file" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })


-- vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
