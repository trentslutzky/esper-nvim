-- ESPER NVIM
require('modules.loader')
local term = require('util').term

local g = vim.g
local set = vim.opt
local cmd = vim.cmd
local wo = vim.wo

set.mouse = 'a'
set.cursorline = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
-- show number and relnumber
set.number = true
set.relativenumber = true

-- colorscheme stuff
cmd('syntax on')
set.termguicolors = true

-- switch colorscheme based on darkmode
if os.getenv("DARKMODE") == "1" then
  cmd('colorscheme onehalfdark')
  set.background = 'dark'
else
  cmd('colorscheme onehalflight')
  set.background = 'light'
end

cmd('hi Normal guibg=none')
--cmd('hi Cursorline guibg=none cterm=bold')

set.completeopt = 'menuone,noselect'
set.updatetime = 100
wo.signcolumn = 'yes'

-- prevent code wrapping
set.wrap = false

-- git blame stuff
g.gitblame_message_template = ' <author> (<date>)'
g.gitblame_date_format = '%r'

require('modules.setup')
require('keymap')
