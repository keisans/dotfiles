vim.g.mapleader = ","
vim.g.maplocalleader = ","

local opt = vim.opt

-- General
opt.number = true
-- opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- No swapfile, giant undo
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.config/nvim/undo"

-- Use full color
opt.termguicolors = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Mouse
opt.mouse = "a"

-- Split
opt.splitbelow = true
opt.splitright = true

-- Keep 10 lines above/below cursor
opt.scrolloff = 10

-- Show the last command
opt.showcmd = true

-- Show matching brackets
opt.showmatch = true

-- Fast update times
opt.updatetime = 50

-- Fix netrw <c-l> mapping
local augroup = vim.api.nvim_create_augroup("netrw_fix", {clear = true})
vim.api.nvim_create_autocmd("filetype", {
  pattern = "netrw",
  group = augroup,
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<c-l>", "<c-w>l", {noremap = true, silent = true})
  end
})
