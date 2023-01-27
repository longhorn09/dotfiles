"************************************
"* 20161031 - NT - initial creation
"************************************
set nocompatible
filetype off
"                     set background=dark
colorscheme elflord   "color scheme with muted colors
set term=ansi
syntax on
set showmatch
set incsearch
"set hlsearch         "highlights the search
set relativenumber    " set number, set relativenumber , set nonumber
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


"####################################################
"# setup for 
"####################################################
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'gmarik/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"call vundle#end()
"filetype plugin indent on
