if exists('b:my_markdown_ftplugin')
    finish
endif
let b:my_markdown_ftplugin = 1

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

setlocal tabstop=2 softtabstop=2 shiftwidth=2 wrap
nnoremap o A<CR>
iabbrev [[ \left[ \right] <++><esc>BBhi
iabbrev [. \left[ \right. <++><esc>BBhi
iabbrev (( \left( \right) <++><esc>BBhi
iabbrev (. \left( \right. <++><esc>BBhi
iabbrev {{ \lbrace \rbrace <++><esc>BBhi
iabbrev {. \left\{ \right. <++><esc>BBhi
inoreabbrev $$$$ $$$$<++><esc>5hi<cr><esc>k$a

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption
