return {
  "theprimeagen/refactoring.nvim", 
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },
  keys = {
    { "<Leader>ri", function() require("refactoring").refactor("Inline Variable") end, mode = { "n", "x" }, desc = "[r]efactor [i]nline var" },
    { "<Leader>rv", function() require("refactoring").refactor("Extract Variable") end, mode = "x", desc = "[r]efactor extract [v]ar" },
    { "<Leader>re", function() require("refactoring").refactor("Extract Function") end, mode = "x", desc = "[r]efactor [e]xtract function" },
    { "<Leader>rf", function() require("refactoring").refactor("Extract Function To File") end, mode = "x", desc = "[r]efactor extract to [f]ile" },
    { "<Leader>rb", function() require("refactoring").refactor("Extract Block") end, desc = "[r]efactor extract [b]lock" },
    { "<Leader>rbf", function() require("refactoring").refactor("Extract Block To File") end, desc = "[r]efactor extract [b]lock to [f]ile" },
    { "<Leader>rr", function() require("refactoring").select_refactor() end, mode = { "n", "x" }, desc = "[r][r]efactor select" },
  },
  config = function()
    require("refactoring").setup()
  end,
}
