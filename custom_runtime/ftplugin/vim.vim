if exists('b:my_vim_ftplugin')
    finish
endif

" vint: -ProhibitAbbreviationOption
let b:my_vim_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

setlocal tabstop=4 softtabstop=4 shiftwidth=4

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption

