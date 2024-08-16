local vim = vim
local g = vim.g

local colors = require("colors")
local lighten = require('util').lighten

require('core.plugin_configs')
local term = require('util').term

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl })
end

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

require("nvim-tree").setup {
  view = {
    side = "left",
    width = 35,
  },
  filters = {
    custom = {
      "^.git$",
      "^.github$",
      "^.git-crypt$",
      "^.mypy_cache$",
      "^__pycache__$"
    }
  },
  renderer = {
    highlight_opened_files = "name",
  }
}

vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})

vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("Neotree close") end,
})

vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("AtlasClose") end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
	group = vim.api.nvim_create_augroup("edit_text", { clear = true }),
	pattern = { "gitcommit", "markdown", "txt", "text" },
	desc = "Enable spell checking and text wrapping for certain filetypes",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

require("yanky").setup({
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 100,
  },
})

require('numbers').setup({
  excluded_filetypes = {
      "help",
      "dashboard",
      "octo",
      "NvimTree",
      "bufferpane",
      "SidebarNvim",
      "startup",
      "Atlas",
      "TelescopePrompt",
      "NeogitStatus",
      "NeogitPopup",
      "neo-tree",
      "neo-tree-popup",
  },
})

require("ibl").setup {
  scope = { enabled = false, show_start = false }
}

require('hlslens').setup({
  auto_enable = false,
  calm_down = true,
  nearest_only = true,
  nearest_float_when = 'never'
})

require("scrollbar.handlers.search").setup()
require("scrollbar").setup({
  marks = {
    Search = { color = term(2) },
     Error = { color = term(1) },
      Warn = { color = term(3) },
      Info = { color = term(4) },
      Hint = { color = term(4) },
      Misc = { color = term(15) },
  },
  excluded_filetypes = {
    "cmp_docs",
    "cmp_menu",
    "noice",
    "TelescopePrompt",
    "Atlas",
    "NvimTree"
  }
})

require'nvim-lastplace'.setup{}

require('todo-comments').setup()

require('nvim_comment').setup()

require('gitsigns').setup({
  signs = {
    add          = { text = '▕' },
    change       = { text = '▕' },
    delete       = { text = '╺' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
})

-- require('autoclose').setup({
--   disable_filetype = { "TelescopePrompt" , "vim" },
-- })

g.floaterm_title = ""
g.floaterm_borderchars = "        "
g.floaterm_autoclose = 0

require('nvim-test').setup()

-- require('neorg').setup {
--     load = {
--         ["core.defaults"] = {},
--         ["core.dirman"] = {
--             config = {
--                 workspaces = {
--                     narmi = "~/notes/narmi",
--                     finances = "~/notes/finances",
--                 }
--             }
--         }
--     }
-- }

require('gitblame').setup {
  enabled = true,
  display_virtual_text = false,
}

require("startup").setup({ theme = "startify" })

local my_reactive_preset = {
  name = 'custom',
  modes = {
    no = {
      winhl = {},
      hl = {},
      operators = {
        d = {
          winhl = {
            CursorLineNr = { fg = colors.accent_red, bg = colors.bg_1 }
          },
        },
        y = {
          winhl = {
            CursorLineNr = { fg = colors.accent_yellow, bg = colors.bg_1 }
          },
        },
        [">"] = { winhl = { CursorLineNr = { fg = colors.accent_blue, bg = colors.bg_1 }}},
        ["<"] = { winhl = { CursorLineNr = { fg = colors.accent_blue, bg = colors.bg_1 }}},
      }
    },
    i = {
      winhl = {
        CursorLineNr = { fg = colors.accent_green, bg = colors.bg_1 },
      },
    },
    [{ 'v', 'V', '\x16' }] = {
      winhl = {
        CursorLineNr = { fg = colors.accent_yellow, bg = colors.bg_3 }
      },
    }
  }
}

require("reactive").add_preset(my_reactive_preset)

require("reactive").setup({
  custom = true,
})

require("atlas").setup({
  open = false,
})

-- require('neogit').setup({
--   kind = "vsplit",
-- })
