if exists("g:my_python_ftplugin")
    finish
endif
let g:my_python_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

setlocal tabstop=4 softtabstop=4 shiftwidth=4
compiler python

let &cpo = s:save_cpo
unlet s:save_cpo
