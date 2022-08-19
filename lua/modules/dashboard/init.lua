local g = vim.g
local cmd = vim.cmd
local get_os_command_output = require('util').get_os_command_output

local db = require('dashboard')
local term = require('util').term

local home = os.getenv('HOME')

db.default_executive ='telescope'

-- craft a dynamic header that gets the:
--   cwd
--   branch name if in a git dir

local header = {"neovim",""}

local wd = vim.fn.getcwd()

wd = " " .. wd

table.insert(header,wd)

local branch_name, in_git, _ = get_os_command_output {
  "git",
  "rev-parse",
  "--abbrev-ref",
  "HEAD",
}
table.insert(header,"")

if(#branch_name > 0)then
  branch_name = branch_name[1]
  -- for _ = (#wd - #branch_name - 4),1,-1 do
  --   branch_name = branch_name .. " "
  -- end
  table.insert(header, " " .. branch_name)
end

db.custom_header = header

-- db.custom_header = {
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⣠⣤⣴⣶⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⢰⣶⣶⣠⣤⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣶⣶⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⢰⣶⣶⣶⣶⣆⣤⣴⣶⣶⣶⡆',
-- '⢠⣾⣿⡿⠛⠛⠛⠛⠿⣿⣿⡄⠀⠀⠀⠀⠀⢠⣿⣿⡿⠛⠛⠛⠛⠛⠃⠀⠀⠀⠀⠀⢸⣿⣿⣿⠟⠛⠛⠛⠻⢿⣿⣷⡄⠀⠀⠀⠀⢠⣿⣿⠿⠛⠛⠛⠛⢿⣿⣷⡄⠀⠀⠀⠀⠘⠛⠛⣿⣿⣿⡿⠿⠿⠿⠿⠇',
-- '⢸⣿⣿⠀⠀⠀⠀⠀⠀⢹⣿⣷⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⣾⣿⡟⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⡟⠀⠀⠀⠀⠀⠀',
-- '⣿⣿⣿⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⢸⣿⣿⣄⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀',
-- '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠻⢿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀',
-- '⣿⣿⣿⠉⠉⠉⠉⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⣿⣿⡆⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⣿⣿⡏⠉⠉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀',
-- '⠘⣿⣿⣦⣀⣀⣀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⣼⣿⣿⠃⠀⠀⠀⠀⢸⣿⣿⣀⣀⣀⣀⣀⣀⣴⣿⣿⠇⠀⠀⠀⠀⠸⣿⣿⣦⣀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⢀⣀⣀⣿⣿⣇⣀⣀⣀⡀⠀⠀',
-- '⠀⠈⠻⠿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠁⠀⠀⠀⠀⠀⠀⠙⠻⠿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
-- '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',}


-- db.custom_header = {
-- '',
-- '   ________  ________  ________  ________   ________  ________   ',
-- '  ╱    ╱   ╲╱        ╲╱        ╲╱    ╱   ╲ ╱        ╲╱        ╲  ',
-- ' ╱         ╱         ╱         ╱         ╱_╱       ╱╱         ╱  ',
-- '╱         ╱        _╱         ╱╲        ╱╱         ╱         ╱   ',
-- '╲__╱_____╱╲________╱╲________╱  ╲______╱ ╲________╱╲__╱__╱__╱    ',
-- '',
-- }

-- db.custom_header = {'','esper nvim',''}

db.custom_center = {
      {icon =  '  ',
      desc =   'Recent files  ',
      action = 'Telescope oldfiles',
      shortcut = ''},
      {icon =  '  ',
      desc =   'Find Files    ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = ''},
      {icon =  '  ',
      desc =   'Git Files     ',
      action = 'Telescope git_files',
      shortcut = ''},
      {icon =  '  ',
      desc =   'Find word     ',
      action = 'Telescope live_grep',
      shortcut = ''},
      {icon =  '  ',
      desc =   'Pull Requests ',
      action = 'Octo pr list',
      shortcut = ''},
      {icon =  '  ',
      desc =   'Issues        ',
      action = 'Octo issue list assignee=trentslutzky',
      shortcut = ''},
    }

db.custom_footer = {''}

-- set colors
cmd('hi DashboardHeader guifg='..term(3))
cmd('hi DashboardCenter guifg='..term(2))
cmd('hi DashboardCenterIcon guifg='..term(4))
