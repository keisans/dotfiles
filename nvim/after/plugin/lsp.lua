require("mason").setup()
require("mason-lspconfig").setup({

  ensure_installed = {"tsserver", "eslint", "rust_analyzer"}

})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Set up lsp bindings on buffer attach
local on_attach = function(client, bufnr)
  local buf_opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "<Leader>d", vim.lsp.buf.definition, buf_opts)
  vim.keymap.set("n", "<Leader>j", vim.lsp.buf.hover, buf_opts)
  vim.keymap.set("n", "<Leader>k", vim.lsp.buf.code_action, buf_opts)
  vim.keymap.set("n", "<Leader>r", vim.lsp.buf.references, buf_opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, buf_opts)
end

require("lspconfig").tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").denols.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

require("lspconfig").rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

local cmp = require("cmp")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<Tab>"] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= "prompt" and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= "prompt" and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }
  }, {
    { name = "buffer" }
  })
})
