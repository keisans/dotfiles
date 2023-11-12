-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Show the last command
vim.opt.showcmd = true

-- Indents
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Natural text search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use 24bit colors in the terminal
vim.opt.termguicolors = true

-- Quick update
vim.opt.updatetime = 50

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true


-- Swap / undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
