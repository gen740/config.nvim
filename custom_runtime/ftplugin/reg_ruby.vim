if exists('b:my_ruby_ftplugin')
    finish
endif

let b:my_ruby_ftplugin = 1
let s:save_cpo = &cpoptions
set cpoptions&vim

nnoremap <m-r> :vertical copen<cr>:vertical resize 40<cr>:wincmd h<cr>:AsyncRun make run<cr>
nnoremap <m-c> :vertical copen<cr>:vertical resize 40<cr>:wincmd h<cr>:AsyncRun make build<cr>
nnoremap <m-s> :AsyncStop<cr>

setlocal tabstop=2 softtabstop=2 shiftwidth=2
setlocal conceallevel=2 concealcursor=nvic


let &cpoptions = s:save_cpo
unlet s:save_cpo
