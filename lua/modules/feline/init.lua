local api = vim.api
local fn = vim.fn
local g = vim.g
local term = require('util').term

-- Initialize the components table
local components = {
    active = {},
    inactive = {}
}
-- Insert three sections (left and right) for the active statusline
table.insert(components.active, {})
table.insert(components.active, {})

-- Insert two sections (left and right) for the inactive statusline
table.insert(components.inactive, {})
table.insert(components.inactive, {})

local vi_mode_colors = {
  n = term(2),
  i = term(4),
}

local function vi_mode_color()
  return vi_mode_colors[vim.fn.mode()] or term(7)
end

-- LEFT SIDE

-- VI Mode
local vi_mode_utils = require 'feline.providers.vi_mode'
components.active[1][1] = {
    provider = function()
      -- make the mode lowercase
      return string.lower(vi_mode_utils.get_vim_mode())
    end,
    hl = function()
        return {
            fg = term(0),
            bg = vi_mode_color(),
            style = 'bold',
        }
    end,
    left_sep = '█',
    right_sep = '█',
    icon = '',
    opts = {
      padding = 'center',
    }
}


-- filename & devicon
local filename = api.nvim_buf_get_name(0)
-- short relative
--filename = fn.pathshorten(fn.fnamemodify(filename, ':~:.'))
-- base only
filename = fn.fnamemodify(filename, ':t')

local devicons = require('nvim-web-devicons')
local icon_str, icon_color = require('nvim-web-devicons')
  .get_icon_color(api.nvim_buf_get_name(0))

components.active[1][2] = {
  provider = function()
    return icon_str .. " " .. filename
  end,
  hl = function()
    return{
      fg = icon_color,
    }
  end,
  left_sep = '█',
  right_sep = '█',
}


-- RIGHT SIDE

-- git status
components.active[2][1] = {
  provider = 'git_branch',
  left_sep = ' ',
  right_sep = ' ',
}

-- position
components.active[2][2] = {
  provider = 'position',
  hl = function()
    return{
      fg = term(0),
      bg = vi_mode_color(),
    }
  end,
  left_sep = '█',
  right_sep = '█',
}

components.active[2][3] = {
  provider = 'line_percentage',
  hl = function()
    return{
      fg = term(0),
      bg = vi_mode_color(),
    }
  end,
  left_sep = '',
  right_sep = '█',
}

require("feline").setup({
  components = components,
  disable = {
    filetypes = {}
  }
})
