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
