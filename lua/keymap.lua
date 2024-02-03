
local set = vim.keymap.set

-- set leader to space (" ")
vim.g.mapleader = " "

-- clear search highlight
set("n","<leader>n",":nohlsearch<cr>")

-- Telescope bindings
set("n","<leader>d","<cmd>Telescope lsp_definitions<cr>")
set("n","<leader>r","<cmd>Telescope lsp_references<cr>")
set("n","<leader>of","<cmd>Telescope oldfiles<cr>")
set("n","<leader>f","<cmd>lua require('core.plugin_configs.telescope').project_files()<cr>")
set("n","<leader>F","<cmd>Telescope find_files<cr>")
set("n","<leader>gc","<cmd>Telescope git_commits<cr>")
set("n","<leader>gs","<cmd>Telescope git_status theme=dropdown<cr>")
set("n","<leader>gS","<cmd>Telescope grep_string<cr>")
set("v","<leader>gS","<cmd>Telescope grep_string<cr>")
set("n","<leader>lg","<cmd>lua require('telescope.builtin').live_grep({ file_ignore_patterns = {'tests'} })<cr>")
set("n","<leader>lG","<cmd>Telescope live_grep<cr>")
set("n","<leader>b","<cmd>Telescope buffers theme=ivy previewer=false <cr>")
set("n","<leader>k","<cmd>Telescope keymaps<cr>")
set("n","<leader>t","<cmd>Telescope resume<cr>")
set("n","<leader>h","<cmd>Telescope highlights<cr>")
set("n","<leader>c","<cmd>Telescope command_palette theme=ivy<cr>")
set("n","<leader>p","<cmd>Gitsigns preview_hunk_inline<cr>")

-- nav directions to NEUO
set("n","<C-N>","<C-W>h")
set("n","<C-E>","<C-W>j")
set("n","<C-U>","<C-W>k")
set("n","<C-O>","<C-W>l")
-- also arrow keys for when using laptop keyboard
set("n","<C-Left>","<C-W>h")
set("n","<C-Down>","<C-W>j")
set("n","<C-Up>","<C-W>k")
set("n","<C-Right>","<C-W>l")

-- switch buffers with control-t
set("n","<C-T>","<cmd>bn<cr>")

-- close buffers with control-w
set("n","<C-W>","<cmd>bd<cr>")

-- open close nvimtree
set("n","<C-L>",":NvimTreeToggle<cr>")

-- open github issues
-- set("n","<leader>gi","<cmd>Octo issue list assignee=trentslutzky<cr>")
-- set("n","<leader>gpr","<cmd>Octo pr list createdBy=trentslutzky<cr>")

-- find and replace
set("n","<leader>S",":%s/<C-r><C-w>/")

-- center screen when find next
set("n", "n", "nzz")
set("n", "N", "Nzz")
set("n", "*", "*zz")

-- run custom function to run testclass under cursor
set("n", "<leader>R", "<cmd>lua RunTestUnderCursor()<cr>")

-- codium
--https://github.com/Exafunction/codeium.vim
set('i', '<C-o>', function () return vim.fn['codeium#Accept']() end, { expr = true })
