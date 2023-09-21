return {
  'lewis6991/gitsigns.nvim',
  event = {"BufReadPre", "BufNewFile"},
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signcolumn = false,
    numhl = false,
    linehl = false,
    word_diff = false,
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true})
      map('n', '<leader>gb', gs.toggle_current_line_blame, { noremap = true, desc = "Toggle git blame" })
      map('n', '<leader>gs', gs.stage_hunk, { noremap = true, desc = "Stage hunk" })
      map('n', '<leader>gr', gs.reset_hunk, { noremap = true, desc = "Reset hunk" })
      map('n', '<leader>gS', gs.stage_buffer, { noremap = true, desc = "Stage current buffer" })
      map('n', '<leader>gR', gs.reset_buffer, { noremap = true, desc = "Reset current buffer" })
      map('n', '<leader>gd', gs.diffthis, { noremap = true, desc = "Diff the current line" })
      map('n', '<leader>gg', gs.toggle_signs, { noremap = true, desc = "Toggle git signs column" })
    end
  }
}
