syntax enable
colorscheme ron
if has('gui_running')
    set background=light
else
    set background=dark
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'jiangmiao/auto-pairs'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
set tw=80               " Text width
set cmdheight=1         " Command window height
set scrolloff=5         " Keep 5 lines for (top/bottom) scope
set laststatus=2        " Always show the status line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch           " Show matching brackets
set mat=5               " How many tenths of a second to blink matching brackets for
set nohlsearch          " Don't highlight all search results
set incsearch           " Searches for strings incrementally
set smartcase           " Enable smart-case search
set ignorecase          " Always case-insensitive

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000        " How many lines of history to remember
set swapfile
set directory^=~/.vim/swap// " Protect changes between writes
set writebackup         " Protect against crask-during-write
set nobackup            " But do not persist backup after successful write
set backupcopy=auto     " Use rename-and-write-new method whenever safe

" Patch required to honor double slash at end
if has("patch-8.1.0251")
    " Consolidate the writebackups
    set backupdir^=~/.vim/backup//
end

set undolevels=1000     " Number of undo levels
set undofile            " Maintain edit history between sessions
set undodir^=~/.vim/undo// " Specify directory for undo files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Security
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set modelines=0
set nomodeline
