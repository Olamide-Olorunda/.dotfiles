vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.encoding = "utf-8"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.wrap = false

vim.opt.smartindent = true

vim.opt.guicursor =
"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
-- vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.opt.selection = "inclusive"
vim.opt.autochdir = false

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.cursorline = true
vim.opt.updatetime = 300

local undodir = vim.fn.expand("~/.vim/undodir")
if
    vim.fn.isdirectory(undodir) == 0
then
  vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.autoread = true

vim.opt.showmatch = true
