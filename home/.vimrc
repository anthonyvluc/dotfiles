""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""
set relativenumber      " Show line numbers
set linebreak           " Break lines at word (requires Wrap lines)
set textwidth=100       " Line wrap (number of cols)
set showmatch           " Highlight matching brace
set visualbell          " Use visual bell (no beeping)
" set noerrorbells       " Don't beep
set mouse=a             " Use mouse everywhere
set ruler               " Show row and column ruler information
set list                " Show tabs
set nowrap              " Do not wrap line
set cursorcolumn
set cursorline

""""""""""""""""""""""""
"
""""""""""""""""""""""""
set hlsearch            " Highlight all search results
set smartcase           " Enable smart-case search
set ignorecase          " Always case-insensitive
set incsearch           " Searches for strings incrementally


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
set preserveindent      " 

""""""""""""""""""""""""
"
""""""""""""""""""""""""
set history=1000        " How many lines of history to remember
set undolevels=1000     " Number of undo levels

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


