if exists("g:my_tex_ftplugin")
    finish
endif
let g:my_tex_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

nnoremap <m-r> :copen<cr>:resize 5<cr>:wincmd k<cr>:silent AsyncRun make run<cr>
nnoremap <m-c> :copen<cr>:resize 5<cr>:wincmd k<cr>:silent AsyncRun make build<cr>

autocmd BufWritePost *.tex :AsyncRun make build


let &cpo = s:save_cpo
unlet s:save_cpo
