if exists('b:my_c_ftplugin')
    finish
endif

" vint: -ProhibitAbbreviationOption
let b:my_c_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

let g:neomake_make_maker = {
    \ 'exe': 'make',
    \ 'args': ['run'],
    \ }

setlocal tabstop=2 softtabstop=2 shiftwidth=2

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption
