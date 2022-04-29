
local set = vim.keymap.set

-- set leader to space (" ")
vim.g.mapleader = " "

-- clear search highlight
set("n","<leader>n",":nohlsearch<cr>")

-- Telescope bindings
set("n","<leader>ff","<cmd>Telescope find_files<cr>")
set("n","<leader>of","<cmd>Telescope oldfiles<cr>")
set("n","<leader>gf","<cmd>Telescope git_files<cr>")
set("n","<leader>gc","<cmd>Telescope git_commits<cr>")
set("n","<leader>lg","<cmd>Telescope live_grep<cr>")
set("n","<leader>b","<cmd>Telescope buffers<cr>")

-- nav directions to NEUO
set("n","<C-N>","<C-B>h")
set("n","<C-E>","<C-B>j")
set("n","<C-U>","<C-B>k")
set("n","<C-O>","<C-B>l")

-- switch buffers with control-t
set("n","<C-T>","<cmd>bn<cr>")

-- close buffers with control-t
set("n","<C-W>","<cmd>bd<cr>")
