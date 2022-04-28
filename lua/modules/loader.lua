local cmd = vim.cmd

cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- colorscheme
  use 'joshdick/onedark.vim'

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'windwp/nvim-autopairs'

  --treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- devicons
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'

  -- bufferline
  use {'akinsho/bufferline.nvim', tag = "*",
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- feline
  use {'feline-nvim/feline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- tablines
  use "lukas-reineke/indent-blankline.nvim"

  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- clap
  use 'liuchengxu/vim-clap'

  -- gitsigns
  use {
    'lewis6991/gitsigns.nvim'
  }

  -- dahboard
  use 'glepnir/dashboard-nvim'

  -- smooth scrolling
  -- use "karb94/neoscroll.nvim"
  use 'declancm/cinnamon.nvim'

  -- nvim tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }

  -- fancy colors on hex and stuff in vim
  use 'norcalli/nvim-colorizer.lua'

  -- dim irrelevant code
  use 'folke/twilight.nvim'

  -- scrollbar with other features
  use 'kevinhwang91/nvim-hlslens'
  use 'petertriho/nvim-scrollbar'

  use 'max-0406/autoclose.nvim'

  use 'ethanholz/nvim-lastplace'

end)
