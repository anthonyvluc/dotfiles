syntax enable
colorscheme ron
if has('gui_running')
    set background=light
else
    set background=dark
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Keep Plugin commands between vundle#begin/end.
" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Personal Plugins "
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""
set relativenumber      " Show line numbers
set linebreak           " Break lines at word (requires Wrap lines)
set textwidth=100       " Line wrap (number of cols)
set showmatch           " Highlight matching brace
set novisualbell        " Dont' use visual bell
set noerrorbells        " Don't beep
set mouse=a             " Use mouse everywhere
set ruler               " Show row and column ruler information
set list                " Ensure we  show tabs
set listchars=tab:>-,trail:- " Show tabs and trailing whitespace
set nowrap              " Do not wrap line
set tw=80               " Text 
"set cmdheight=2         " Command window height
set scrolloff=5         " Keep 5 lines for (top/bottom) scope
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2        " Always show the status line

""""""""""""""""""""""""
"
""""""""""""""""""""""""
set showmatch           " Show matching brackets
set mat=5               " How many tenths of a second to blink matching brackets for
set nohlsearch          " Don't highlight all search results
set incsearch           " Searches for strings incrementally
set smartcase           " Enable smart-case search
set ignorecase          " Always case-insensitive

""""""""""""""""""""""""
" Whitespace
""""""""""""""""""""""""
set autoindent          " Auto-indent new lines
set softtabstop=4       " Number of spaces per Tab
set shiftwidth=4        " Number of auto-indent spaces
set tabstop=4           " Real tabs should be 4, but they will show with set list on
set smartindent         " Enable smart-indent
set smarttab            " Enable smart-tabs
set expandtab           " Use spaces instead of tabs
set copyindent          " 
set preserveindent      " 
set cindent             " C-Style indenting
filetype plugin indent on " Load filetype plugin and indent settings

""""""""""""""""""""""""
"
""""""""""""""""""""""""
set history=1000        " How many lines of history to remember
set undolevels=1000     " Number of undo levels
set undofile            " Maintain edit history between sessions
set udir=~/.vim/undodir " Specify directory for undo files

""""""""""""""""""""""""
"
""""""""""""""""""""""""
set backspace=indent,eol,start  " Backspace behaviour

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif


