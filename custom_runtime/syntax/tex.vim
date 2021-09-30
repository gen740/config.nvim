if exists("g:my_tex_syntax")
    finish
endif
let g:my_tex_syntax = 1
let s:save_cpo = &cpo
set cpo&vim

set conceallevel=2

let &cpo = s:save_cpo
unlet s:save_cpo
