local lsp_status = require('lsp-status')
lsp_status.register_progress()

local nvim_lsp = require('lspconfig')

nvim_lsp.tsserver.setup { 
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities,
}

nvim_lsp.rust_analyzer.setup {
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
}
