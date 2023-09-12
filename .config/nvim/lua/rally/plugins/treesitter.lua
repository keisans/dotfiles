return {
  -- Nvim treesitter setup
  { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate", 
  dependencies = { 
    "nvim-treesitter/nvim-treesitter-textobjects" 
  },
  config = function()
	  require("nvim-treesitter.configs").setup {
		  ensure_installed = {"css", "html", "javascript", "typescript", "tsx", "lua", "rust", "graphql" },
      auto_install = false,
		  highlight = {
			  enable = true,
		  },
      indent = {
        enable = true,
      },
      -- not sure about using this yet. Using <c-s> for completion
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     init_selection = "<c-space>",
      --     node_incremental = "<c-space>",
      --     scope_incremental = "<c-s>",
      --     node_decremental = "<c-z>",
      --   },
      -- },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
	  }
  end,
}
}
