-- Split navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true})

-- Clipboard stuff
vim.api.nvim_set_keymap("n", "<leader>y", "\"+y", {noremap = true, desc = "Yank to clipboard"})
vim.api.nvim_set_keymap("n", "<leader>Y", "\"+Y", {noremap = true, desc = "Yank to clipboard"})
vim.api.nvim_set_keymap("v", "<leader>y", "\"+y", {noremap = true, desc = "Yank to clipboard"})
vim.api.nvim_set_keymap("v", "<leader>Y", "\"+Y", {noremap = true, desc = "Yank to clipboard"})

vim.api.nvim_set_keymap("x", "<leader>p", "\"_dP", {noremap = true, desc = "Replace without losing register"})

-- Sorry dutch vimmers
vim.api.nvim_set_keymap("i", "jk", "<ESC>", {noremap = true, desc = "jk -> <ESC>"})

-- Dumbest key map override
vim.api.nvim_set_keymap("n", "Q", "<NOP>", {noremap = true, desc = "Q -> <NOP>"})

-- Second dumbest key map override
vim.api.nvim_set_keymap("n", "U", "<cmd>redo<cr>", {noremap = true, desc = "Redo"})

-- Leave terminal mode
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, desc = "Leave terminal mode"})

-- Move lines
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", {noremap = true, desc = "Move line down"})
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", {noremap = true, desc = "Move line up"})

-- Buffer navigation
vim.api.nvim_set_keymap("n", "<leader>bn", "<cmd>bn<cr>", {noremap = true, desc = "Next buffer"})
vim.api.nvim_set_keymap("n", "<leader>bp", "<cmd>bp<cr>", {noremap = true, desc = "Previous buffer"})

-- Help with shift keys
vim.api.nvim_create_user_command("WQ", "wq", {bang = false})
vim.api.nvim_create_user_command("Wq", "wq", {bang = false})
vim.api.nvim_create_user_command("Vsp", "vsp", {bang = false})
