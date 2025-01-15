-- lazy plugins

local plugins = {
  -- plenary is always needed nowadays
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  -- my colorscheme (I need to make this rely on hue instead)
  -- "trentslutzky/onehalf",

  -- telescope is essential
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-github.nvim" },
      { "cljoly/telescope-repo.nvim" },
      { "LinArcX/telescope-command-palette.nvim" }
    }
  },

  -- trying mason for lsp stuff
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  -- nvim tree
  -- "nvim-tree/nvim-tree.lua",

  -- neo tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  },

  -- treesitter
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  -- autocomplete & snippets
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-buffer",
  "onsails/lspkind.nvim",

  -- snippets
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "honza/vim-snippets",

  -- sidebar
  -- "sidebar-nvim/sidebar.nvim",

  -- autoclose
  -- "m4xshen/autoclose.nvim",

  -- git
  "f-person/git-blame.nvim",
  -- "tpope/vim-fugitive",
  -- "NeogitOrg/neogit",

  -- heirline (Status bar and buffer bar)
  "rebelot/heirline.nvim",

  "gbprod/yanky.nvim",
  "nkakouros-original/numbers.nvim",
  "ethanholz/nvim-lastplace",
  "kevinhwang91/nvim-hlslens",
  "petertriho/nvim-scrollbar",
  "terrortylor/nvim-comment",
  {"lukas-reineke/indent-blankline.nvim", main="ibl"},

  -- "ruifm/gitlinker.nvim",

  "lewis6991/gitsigns.nvim",

  "famiu/bufdelete.nvim",

  "voldikss/vim-floaterm",

  "klen/nvim-test",

  "folke/todo-comments.nvim",

  "rasulomaroff/reactive.nvim",
}

local opts = {}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
