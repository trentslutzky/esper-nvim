-- ESPER NVIM
require('core.loader')

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

vim.opt.laststatus = 3

set.hidden = true

-- g.loaded_netrw = 1
-- g.loaded_netrwPlugin = 1

-- hide the mode in normal vim command lline
-- set.noshowmode = true

-- keep cursor at the center of the screen always
-- set.scrolloff = 999

-- pad the cursor with a certain num of lines
set.scrolloff = 0

-- show number and relnumber
set.number = true
set.relativenumber = true

set.completeopt = 'menuone,noselect'
set.updatetime = 1000
wo.signcolumn = 'yes'

-- prevent code wrapping because I hate it
set.wrap = false

-- git blame stuff
g.gitblame_message_template = ' <author> (<date>)'
g.gitblame_date_format = '%r'

-- folding stuff
set.foldcolumn = '1'
set.foldlevel = 99
set.foldlevelstart = 99
set.foldenable = true

P = function(v)
  print(vim.inspect(v))
  return v
end

--
require('keymap')
require('colors')
require('core.setup')
require('colors')
