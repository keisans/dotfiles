return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_null_ls = require("mason-null-ls")

    mason.setup({})
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "lua_ls",
        "graphql",
        "rust_analyzer",
        "html",
        "cssls"
      },
      automatic_installation = true,
    })

    mason_null_ls.setup({
      ensure_installed = {
        "prettierd",
        "eslint_d",
      }
    })
  end
}
