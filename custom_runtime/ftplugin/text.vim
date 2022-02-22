if exists('b:my_text_ftplugin')
    finish
endif
let b:my_text_ftplugin = 1

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
setlocal textwidth=80

abbreviate dash ――

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption
