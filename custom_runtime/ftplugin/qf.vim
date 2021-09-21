if exists("g:my_qf_ftplugin")
    finish
endif
let g:my_qf_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

autocmd FileType qf set nobuflisted
setlocal wrap nobuflisted
setlocal nocursorline nonu norelativenumber

let &cpo = s:save_cpo
unlet s:save_cpo
