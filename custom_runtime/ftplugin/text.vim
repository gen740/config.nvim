if exists("b:my_text_ftplugin")
    finish
endif
let b:my_text_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
setlocal textwidth=80

let &cpo = s:save_cpo
unlet s:save_cpo
