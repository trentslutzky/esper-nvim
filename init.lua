-- ESPER NVIM
require('modules.loader')

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
set.clipboard = 'unnamedplus'

-- keep cursor at the center of the screen always
-- set.scrolloff = 999
-- pad the cursor with a certain num of lines
set.scrolloff = 0

-- show number and relnumber
set.number = true
set.relativenumber = true

set.completeopt = 'menuone,noselect'
set.updatetime = 100
wo.signcolumn = 'yes'

-- prevent code wrapping because I hate it
set.wrap = false

-- git blame stuff
g.gitblame_message_template = ' <author> (<date>)'
g.gitblame_date_format = '%r'

cmd('nnoremap <buffer><silent> <c-q> <cmd>call Black()<cr>')
cmd('inoremap <buffer><silent> <c-q> <cmd>call Black()<cr>')
--
require('keymap')
require('colors')
require('modules.setup')
