if exists("g:my_make_ftplugin")
    finish
endif
let g:my_make_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap

let &cpo = s:save_cpo
unlet s:save_cpo
