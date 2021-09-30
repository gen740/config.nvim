if exists("g:my_qf_syntax")
    finish
endif
let g:my_qf_syntax = 1
let s:save_cpo = &cpo
set cpo&vim


let &cpo = s:save_cpo
unlet s:save_cpo
