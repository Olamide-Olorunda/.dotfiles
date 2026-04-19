vim.opt.nu = true
vim.opt.relativenumber = true -- This is huge for jumping lines quickly

-- Tab / Indentation (Standard for JS/Python)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Search behavior
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Aesthetics & UI
vim.opt.termguicolors = true-- Makes colors look elite on your Retina display
vim.cmd.colorscheme = ("habamax")
vim.opt.scrolloff = 10  -- Keeps 10 lines visible above/below cursor
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 50

-- Undo history (saves even after you close nvim)
vim.opt.undodir = os.getenv("HOME") .. "~/.vim/undodir"
vim.opt.undofile = true

vim.opt.showmatch = true
