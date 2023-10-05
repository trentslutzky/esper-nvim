local api = vim.api
local fn = vim.fn
local g = vim.g
local term = require('util').term
local colors = require('colors')

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
  n = term(4),
  i = term(2),
  c = term(5),
}

local function vi_mode_color()
  return vi_mode_colors[vim.fn.mode()] or term(7)
end

local function get_color(group, attr)
    return fn.synIDattr(fn.synIDtrans(fn.hlID(group)), attr)
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
    --left_sep = '█',
    -- right_sep = '█',
    left_sep = '█',
    right_sep = '█',
    icon = '',
    opts = {
      padding = 'center',
    }
}

-- buffer name and icon
components.active[1][2] = {
  provider = function()
    local icon_str, _ = require('nvim-web-devicons')
      .get_icon_color(api.nvim_buf_get_name(0))

    if not icon_str then
      icon_str = " "
    end

    local filepath = api.nvim_buf_get_name(0)
    local filename = fn.fnamemodify(filepath, ':t')

    if filename == "" then
      return "[No Name]"
    end

    return icon_str .. ' ' .. filename
  end,
  hl = function()
    local _, icon_color = require('nvim-web-devicons')
      .get_icon_color(api.nvim_buf_get_name(0))
    return{
      fg = icon_color,
    }
  end,
  left_sep = '  ',
  right_sep = '  ',
}

-- RIGHT SIDE

-- git blame
g.gitblame_display_virtual_text = 0
components.active[2][1] = {
  provider = function()
    local git_blame = require('gitblame')
    local blame_text = git_blame.get_current_blame_text()
    if git_blame.is_blame_text_available() then
      if blame_text ~= "  Not Committed Yet" then
        return blame_text
      else
        return " You - Unstaged"
      end
    else
      return ""
    end
  end,
  hl = function()
    return{
      fg = "#555577",
    }
  end,
  right_sep=' ',
}


-- git branch
components.active[2][2] = {
  provider = 'git_branch',
  left_sep = '█',
  right_sep = '█',
  hl = function()
    return{
      --bg = term(4),
      fg = term(2),
    }
  end,
}

-- position
-- components.active[2][3] = {
--   provider = 'position',
--   hl = function()
--     return{
--       fg = term(0),
--       bg = vi_mode_color(),
--     }
--   end,
--   --left_sep = '█',
--   left_sep = '█',
--   right_sep = '█',
-- }

-- components.active[2][4] = {
--   provider = 'line_percentage',
--   hl = function()
--     return{
--       fg = term(0),
--       bg = vi_mode_color(),
--     }
--   end,
--   left_sep = '',
--   right_sep = '█',
--   --right_sep = '█',
-- }

local my_theme = {
  bg = get_color("NormalFloat", "bg#")
}

require("feline").setup({
  components = components,
  disable = {
    filetypes = {}
  },
  theme = my_theme,
})
