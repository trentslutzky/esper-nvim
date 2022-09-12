local cmd = vim.cmd

cmd [[packadd packer.nvim]]

return require("packer").startup({function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- colorscheme
  use "joshdick/onedark.vim"
  use "rakr/vim-one"
  use "rktjmp/lush.nvim"
  use "mcchrish/zenbones.nvim"
  use "trentslutzky/onehalf"
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- comments
  use "terrortylor/nvim-comment"

  -- lsp
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "onsails/lspkind.nvim"
  use "ray-x/lsp_signature.nvim"
  use "windwp/nvim-autopairs"


  -- language-sepcific stuff
  -- jsx highlighting
  use "maxmellon/vim-jsx-pretty"
  -- js highlighting
  use "yuezk/vim-js"
  -- fish script
  use "dag/vim-fish"

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  -- devicons
  use "ryanoasis/vim-devicons"
  use "kyazdani42/nvim-web-devicons"

  -- bufferline
  use {"akinsho/bufferline.nvim", tag = "*",
    requires = "kyazdani42/nvim-web-devicons"
  }

  -- feline
  use {"feline-nvim/feline.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }

  -- tablines
  use "lukas-reineke/indent-blankline.nvim"

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-github.nvim" },
      { "cljoly/telescope-repo.nvim" },
      { "LinArcX/telescope-command-palette.nvim" },
    },
  }

  -- git stuff
  -- gitsigns
  use {
    "lewis6991/gitsigns.nvim"
  }
  -- git blame
  use "f-person/git-blame.nvim"

  -- octo (issues and prs in nvim)
  use "pwntester/octo.nvim"

  -- dashboard
  use "glepnir/dashboard-nvim"

  -- smooth scrolling
  use "declancm/cinnamon.nvim"

  -- nvim tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    }
  }

  -- fancy colors on hex and stuff in vim
  use "norcalli/nvim-colorizer.lua"

  -- scrollbar with other features
  use "kevinhwang91/nvim-hlslens"
  use "petertriho/nvim-scrollbar"

  -- autoclose
  use "max-0406/autoclose.nvim"

  -- clipboard stuff
  use "gbprod/yanky.nvim"

  -- reopen at the last place
  use "ethanholz/nvim-lastplace"

  -- toggle relative numbers
  use "nkakouros-original/numbers.nvim"

  -- git line link
  use {
    "ruifm/gitlinker.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  use {
    'habamax/vim-godot'
  }

end,
config = {
  display = {
    open_fn = require("packer.util").float,
  }
}})
