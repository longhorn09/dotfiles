"************************************
"* 20161031 - NT - initial creation
"************************************
set nocompatible
filetype off
"                     set background=dark
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
"set visualbell       "gets rid of annoying beeps
set belloff=all      " this will disable all bell notifications, visual and audible
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
"Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kaicataldo/material.vim', {'branch': 'main'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasiser/vim-code-dark'
call plug#end()

" these setup the coc syntax highlights
"     \'coc-pairs',
let g:NERDTreeIgnore = ['node_modules$']

let g:coc_global_extensions = [
      \'coc-snippets',
      \'coc-tsserver',
      \'coc-eslint',
      \'coc-prettier',
      \'coc-json',
    \]

nmap <C-n> :NERDTreeToggle<CR>
set shortmess+=c  "don't give |ins-completion-menu|messages

"let g:airline#extensions#tabline#enabled = 1

let g:material_terminal_italics=1
"let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
let g:material_theme_style = 'darker' 
let g:sonokai_style = 'atlantis'  " 'atlantis' | 'default' | 'andromeda' | 'maia'
"colorscheme gruvbox-material
"colorscheme sonokai
colorscheme codedark

if (has('termguicolors'))
  set termguicolors
endif

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols
let g:airline_symbols.dirty='⚡'
inoremap jk <esc>
"inoremap <esc> <nop>
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
set encoding=utf-8
let g:airline_powerline_fonts = 1
