"************************************
"* 20161031 - NT - initial creation
"************************************
set nocompatible
filetype off
"                     set background=dark
set encoding=utf-8
" some servers have issues with backup files
set hidden
set nobackup
set nowritebackup
"set term=ansi       "DO NOT HAVE set term=gui or it'll jackup color schemes
set updatetime=3000
" always show signcolumn, otherwise could shift text during diagnostics
set signcolumn=yes
syntax on
set showmatch
set incsearch
"set hlsearch         "highlights the search
set number relativenumber    " hybrid relative number 
set showcmd
set ruler
set ignorecase       "ignores case sensitive search 
set smartcase        "will do case sensitivity search if search term has mixed case
set cmdheight=2      "Better display for messages  , also needed for coc
set visualbell       "gets rid of annoying beeps
set tabstop=2
set expandtab        " spaces instead of tabs
set shiftwidth=2     " number of space characters used for indentation
set smarttab
set cindent
" use this for gvim settings
if has("gui_running")
  set lines=40 columns=140
endif

call plug#begin()
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kaicataldo/material.vim', {'branch': 'main'}
Plug 'dracula/vim'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/gruvbox-material'
call plug#end()

" these setup the coc syntax highlights
let g:coc_global_extensions = [
      \'coc-snippets',
     \'coc-pairs',
     \'coc-tsserver',
      \'coc-eslint',
      \'coc-prettier',
      \'coc-json',
    \]

nmap <C-n> :NERDTreeToggle<CR>
set shortmess+=c  "don't give |ins-completion-menu|messages


let g:material_terminal_italics=1
let g:material_theme_style = 'default'
"colorscheme material
colorscheme gruvbox-material


if (has('termguicolors'))
  set termguicolors
endif
