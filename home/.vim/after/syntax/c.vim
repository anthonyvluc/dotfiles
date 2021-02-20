"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" whitespace highlighting
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=#592929

" Show trailing whitespace:
"call matchadd('ExtraWhitespace', '/\s\+$/')

" Show tabs that are not at the start of a line:
"call matchadd('ExtraWhitespace', '/[^\t]\zs\t\+/')

" Show spaces used for indenting (so you use only tabs for indenting).
"call matchadd('ExtraWhitespace', '/^\t*\zs \+/')

" highlight column limits
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"call matchadd('OverLength', '/\%81v.\+/')
