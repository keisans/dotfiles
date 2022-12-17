vim.g.mapleader = ","

vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")

-- Shift key junk
vim.api.nvim_create_user_command(
  "WQ",
  "wq",
  {bang = false}
)

vim.api.nvim_create_user_command(
  "Wq",
  "wq",
  {bang = false}
)
