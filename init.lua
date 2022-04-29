require('modules.loader')

local g = vim.g
local set = vim.opt
local cmd = vim.cmd
local wo = vim.wo

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
cmd('colorscheme onedark')
cmd('hi Normal guibg=#151515')
cmd('hi Cursorline guibg=#171717 cterm=bold')

set.completeopt = 'menuone,noselect'
set.updatetime = 100
wo.signcolumn = 'yes'

-- some stuff for dashboard
g.dashboard_default_executive ='telescope'
cmd('autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2')

-- prevent code wrapping
set.wrap = false

-- git blame stuff
g.gitblame_message_template = ' <author> (<date>)'
g.gitblame_date_format = '%r'

require('modules.setup')
require('keymap')
