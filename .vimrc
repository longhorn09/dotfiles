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
"colorscheme elflord   "color scheme with muted colors
set term=ansi
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
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
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

colorscheme gruvbox
nmap <C-n> :NERDTreeToggle<CR>
set shortmess+=c  "don't give |ins-completion-menu|messages
