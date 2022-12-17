local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<Leader>f', builtin.live_grep, {})
vim.keymap.set('n', '<Leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<Leader>th', builtin.help_tags, {})
vim.keymap.set('n', '<Leader>tf', builtin.find_files, {})
