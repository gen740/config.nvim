if exists('b:my_go_ftplugin')
    finish
endif

let b:my_cpp_ftplugin = 1
let s:save_cpo = &cpoptions
set cpoptions&vim

nnoremap <m-r> :vertical copen<cr>:vertical resize 40<cr>:wincmd h<cr>:AsyncRun make run<cr>
nnoremap <m-c> :vertical copen<cr>:vertical resize 40<cr>:wincmd h<cr>:AsyncRun make build<cr>
nnoremap <m-s> :AsyncStop<cr>

setlocal tabstop=4 shiftwidth=4
setlocal conceallevel=0 concealcursor=nvic
setlocal noexpandtab
set listchars=tab:\ \ ,trail:▒,extends:»,precedes:«,nbsp:%

scriptencoding utf-8

let &cpoptions = s:save_cpo
unlet s:save_cpo
