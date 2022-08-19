
local set = vim.keymap.set

-- set leader to space (" ")
vim.g.mapleader = " "

-- clear search highlight
set("n","<leader>n",":nohlsearch<cr>")

-- goto definition
set("n","<leader>d","<cmd>lua vim.lsp.buf.definition()<cr>")

-- Telescope bindings
set("n","<leader>of","<cmd>Telescope oldfiles<cr>")
set("n","<leader>f","<cmd>lua require('modules.telescope').project_files()<cr>")
set("n","<leader>gc","<cmd>Telescope git_commits<cr>")
set("n","<leader>gs","<cmd>Telescope git_status theme=dropdown<cr>")
set("n","<leader>gS","<cmd>Telescope grep_string<cr>")
set("n","<leader>lg","<cmd>lua require('telescope.builtin').live_grep({ file_ignore_patterns = {'tests'} })<cr>")
set("n","<leader>b","<cmd>Telescope buffers theme=ivy<cr>")
set("n","<leader>k","<cmd>Telescope keymaps<cr>")
set("n","<leader>c","<cmd>Telescope command_palette theme=ivy<cr>")

-- nav directions to NEUO
set("n","<C-N>","<C-W>h")
set("n","<C-E>","<C-W>j")
set("n","<C-U>","<C-W>k")
set("n","<C-O>","<C-W>l")

-- switch buffers with control-t
set("n","<C-T>","<cmd>bn<cr>")

-- close buffers with control-t
set("n","<C-W>","<cmd>bd<cr>")

-- open close nvimtree
set("n","<C-L>",":NvimTreeToggle<cr>")

-- open github issues
set("n","<leader>gi","<cmd>Octo issue list assignee=trentslutzky<cr>")
set("n","<leader>gpr","<cmd>Octo pr list createdBy=trentslutzky<cr>")
