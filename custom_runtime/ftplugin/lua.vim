if exists("g:my_lua_ftplugin")
    finish
endif
let g:my_lua_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

setlocal tabstop=2 softtabstop=2 shiftwidth=2 wrap

let &cpo = s:save_cpo
unlet s:save_cpo
