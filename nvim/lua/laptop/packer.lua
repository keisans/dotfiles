vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Obligatory tpope plugins
  use {
    "tpope/vim-vinegar",
    "tpope/vim-fugitive",
    "tpope/vim-repeat",
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    "dstein64/vim-startuptime",
    cmd = "StartupTime"
  }

  -- Treesitter
  use ({
    'nvim-treesitter/nvim-treesitter',
    {run = ":TSUpdate"}
  })

  -- LSP setup
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Completion
  use {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/nvim-cmp"
  }

  -- Colors
  use {
    "cocopon/iceberg.vim",
    "jonathanfilip/vim-lucius",
    "folke/tokyonight.nvim",
  }

  -- Rose pine needs to be loaded on its own for some reason
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
  })

  -- Which key
  use({
    "folke/which-key.nvim"
  })


end)
