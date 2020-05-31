" update list chars
set listchars=tab:>·,trail:· " Show tabs and trailing whitespace

" tab highlight color
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
highlight SpecialKey ctermfg=251 guifg=#c6c6c6

" highlight column limits
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
