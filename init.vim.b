call plug#begin('~/.vim/plugged')

"
"  THIS FILE IS UNUSED NOW!
"

" cursorline
Plug 'miyakogi/conoline.vim'

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'

" NERD tree
Plug 'scrooloose/nerdtree' " The NERD tree
Plug 'Xuyuanp/nerdtree-git-plugin' " NERD tree git plugin

" dev icons for nicer looking stuff
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'vim-airline/vim-airline'

Plug 'Yggdroot/indentLine' " indent lines
Plug 'tpope/vim-commentary' " commenting
Plug 'raimondi/delimitmate' " auto close quotes, etc

" telescopen fuzzy find
" dependancies - ripgrep (pacman)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" language specific stuff
Plug 'yuezk/vim-js' " js stuff
Plug 'maxmellon/vim-jsx-pretty' " jsx(react) stuff
Plug 'habamax/vim-godot' " godot / gdscript stuff 

" colorscheme stuff
Plug 'joshdick/onedark.vim'
Plug 'dylanaraps/wal.vim'

call plug#end()

syntax on
colorscheme wal

set tabstop=2
set shiftwidth=2
set expandtab

let g:vim_json_conceal=0
let g:indentLine_setConceal = 1

" disable the preview window for YCM
set completeopt-=preview

set number relativenumber

" indent lines config
" let g:indentLine_char = '|'
let g:indentLine_char = ''

" airline config - taken from github somewhere
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)      
" let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
" let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

" NERDtree configs and stuff

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Map Crl-L to toggle NERDTree
nmap <C-l> :NERDTreeToggle<CR>

inoremap <Tab> <C-n>
inoremap <S-Tab> <C-p>

let mapleader = "\<Space>"

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>gf <cmd>Telescope git_files<cr>
nnoremap <leader>gc <cmd>Telescope git_commits<cr>
nnoremap <leader>gs <cmd>Telescope grep_string<cr>

nnoremap <C-N> <C-W>h
nnoremap <C-E> <C-W>j
nnoremap <C-U> <C-W>k
nnoremap <C-O> <C-W>l

set completeopt=menu,menuone,noselect
