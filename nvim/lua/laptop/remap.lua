vim.g.mapleader = ","

-- Window navigation
vim.keymap.set("n", "<C-H>", "<C-W>h", {remap = true})
vim.keymap.set("n", "<C-J>", "<C-W>j", {remap = true})
vim.keymap.set("n", "<C-K>", "<C-W>k", {remap = true})
vim.keymap.set("n", "<C-L>", "<C-W>l", {remap = true})

-- Don't really use ex mode for anything
vim.keymap.set("n", "Q", "<nop>")

-- Easy clipboard yank
vim.keymap.set({"n", "v"}, "<Leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<Leader>Y", [["+Y]])

-- Yes, this is how I leave insert mode, come at me
vim.keymap.set("i", "jk", "<Esc>")

-- Allow paste over selected without losing the yank register
vim.keymap.set("x", "<Leader>p", [["_dP]])

-- Messing with netrw
vim.keymap.set("n", "<C-R>", "<Plug>NetrwRefresh")

-- Terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>")

-- Shift key stupidity
vim.api.nvim_create_user_command("WQ", "wq", {bang = false})
vim.api.nvim_create_user_command("Wq", "wq", {bang = false})
vim.api.nvim_create_user_command("Vsp", "vsp", {bang = false})

