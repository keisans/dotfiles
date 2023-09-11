require("rally.config")
require("rally.lazy")

require("lazy").setup({
  {import = "rally.plugins"},
  {import = "rally.plugins.lsp"},
  }, {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
  })

require("rally.remap")
