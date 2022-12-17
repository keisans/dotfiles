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
    "hrsh7th/nvim-cmp"
  }

  -- Colors
  use {
    "cocopon/iceberg.vim",
    "jonathanfilip/vim-lucius",
    "folke/tokyonight.nvim"
  }

end)
