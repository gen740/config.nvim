if exists("b:my_lua_ftplugin")
    finish
endif

let b:my_lua_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
" autocmd FileType lua set tabstop=4 softtabstop=4 shiftwidth=4 wrap

let &cpo = s:save_cpo
unlet s:save_cpo
