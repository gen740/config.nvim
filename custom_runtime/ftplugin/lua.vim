if exists('b:my_lua_ftplugin')
    finish
endif

let b:my_lua_ftplugin = 1

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
" autocmd FileType lua set tabstop=4 softtabstop=4 shiftwidth=4 wrap

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption
