local term = require('util').term

local set = vim.opt
local cmd = vim.cmd

-- colorscheme stuff
cmd('syntax on')
set.termguicolors = true

-- switch colorscheme based on darkmode
-- if os.getenv("DARKMODE") == "1" then
cmd('colorscheme onehalfdark')
set.background = 'dark'
-- else
--   cmd('colorscheme onehalflight')
--   set.background = 'light'
-- end

cmd('hi Normal guibg=none')

-- bold cursorline text test
cmd('hi Cursorline cterm=bold gui=bold guibg=none')
cmd('hi LineNr cterm=bold gui=bold guibg=none guifg=#555577')

-- gitsigns
cmd('hi GitSignsAdd cterm=bold gui=bold guibg=none guifg='..term(2))
cmd('hi GitSignsAddNr cterm=bold gui=bold guibg=none guifg='..term(2))
cmd('hi GitSignsChange cterm=bold gui=bold guibg=none guifg='..term(3))
cmd('hi GitSignsChangeNr cterm=bold gui=bold guibg=none guifg='..term(3))
cmd('hi GitSignsDelete cterm=bold gui=bold guibg=none guifg='..term(1))
cmd('hi GitSignsDeleteNr cterm=bold gui=bold guibg=none guifg='..term(1))

-- cmp
cmd('hi CmpItmAbbrMatch guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrMatchFuzzy guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrFunction guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrMethod guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrVariable guibg=NONE guifg=#123456')
cmd('hi CmpItmAbbrMatch guibg=NONE guifg=#123456')
