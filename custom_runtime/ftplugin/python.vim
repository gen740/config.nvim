if exists("b:my_python_ftplugin")
    finish
endif
let b:my_python_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

nnoremap <m-r> :vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>:AsyncRun make run<cr>
nnoremap <m-c> :vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>:AsyncRun make build<cr>

setlocal tabstop=4 softtabstop=4 shiftwidth=4
compiler python

let &cpo = s:save_cpo
unlet s:save_cpo
