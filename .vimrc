"************************************
"* 20161031 - NT - initial creation
"************************************
set nocompatible
"                     set background=dark
colorscheme elflord   "color scheme with muted colors
set term=ansi
syntax on
set showmatch
set incsearch
"set hlsearch         "highlights the search
set number
set showcmd
set ruler
set ignorecase       "ignores case sensitive search 
set smartcase        "will do case sensitivity search if search term has mixed case
set cmdheight=2
set visualbell
set tabstop=2
"#######################################
"# https://github.com/junegunn/vim-plug
"#######################################
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Fuzzy finder
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'sheerun/vim-polyglot'

" Initialize plugin system
call plug#end()
