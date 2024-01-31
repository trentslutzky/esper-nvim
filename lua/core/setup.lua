local vim = vim
local g = vim.g

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

-- close nvimtree automatically if buffer is clear
-- credit @EliasA5
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close
vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})

require("yanky").setup({
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 100,
  },
})

require('numbers').setup({
  excluded_filetypes = {"help","dashboard","octo", "NvimTree", "bufferpane", "SidebarNvim"},
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
    "NvimTree"
  }
})

require'nvim-lastplace'.setup{}

require('todo-comments').setup()

require('nvim_comment').setup()

-- require("bufferline").setup{
--   options = {
--     diagnostics = true,
--     show_close_icon = false,
--     show_buffer_icons = false,
--     color_icons = false,
--     buffer_close_icon = '',--'',
--     modified_icon = '●',
--     close_icon = '',--'',
--     show_tab_indicators = false,
--     separator_style = { '', '' },
--     max_name_length = 20,
--     max_prefix_length = 15,
--     tab_size = 25,
--     offsets = {{
--       filetype = "NvimTree",
--       text = "File Browser"
--     },
--     {
--       filetype = "bufferpane",
--       text = "bufferpane"
--     }
--   },
--     hover = {
--         enabled = true,
--         delay = 200,
--         reveal = {'close'}
--     }
--   },
-- }

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

-- require('bufferpane').setup()

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
