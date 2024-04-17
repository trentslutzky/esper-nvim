-- lazy plugins

local plugins = {
  -- plenary is always needed nowadays
  "nvim-lua/plenary.nvim",

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

  "mxw/vim-jsx",
  "leafgarland/typescript-vim",
  "peitalin/vim-jsx-typescript",

  -- nvim tree
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  -- treesitter
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  -- autocomplete & snippets
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-buffer",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "honza/vim-snippets",
  "onsails/lspkind.nvim",

  "psf/black",

  -- sidebar
  -- "sidebar-nvim/sidebar.nvim",

  -- autoclose
  -- "m4xshen/autoclose.nvim",

  -- git
  "f-person/git-blame.nvim",
  -- "tpope/vim-fugitive",
  "NeogitOrg/neogit",

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

  -- "Exafunction/codeium.vim",
  
  "startup-nvim/startup.nvim",

  "rasulomaroff/reactive.nvim",

  -- neorg
  -- {
  --   "nvim-neorg/neorg",
  --   build = ":Neorg sync-parsers",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = function()
  --     require("neorg").setup {
  --       load = {
  --         ["core.defaults"] = {}, -- Loads default behaviour
  --         ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --         ["core.dirman"] = { -- Manages Neorg workspaces
  --           config = {
  --             workspaces = {
  --               notes = "~/notes",
  --             },
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup()
        -- refer to `configuration to change defaults`
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },

  {
    dir = "~/projects/bufferpane.nvim"
  },

  {
    dir = "~/.config/nvim/custom_plugins/atlas"
  }

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
