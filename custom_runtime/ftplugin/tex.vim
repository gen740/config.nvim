if exists("g:my_tex_ftplugin")
    finish
endif
let g:my_tex_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

nnoremap <m-r> :vertical copen<cr>:vertical resize 5<cr>:wincmd h<cr>:silent AsyncRun make run<cr>
nnoremap <m-c> :vertical copen<cr>:vertical resize 5<cr>:wincmd h<cr>:silent AsyncRun make build<cr>
nnoremap ® :vertical copen<cr>:vertical resize 5<cr>:wincmd h<cr>:silent AsyncRun make run<cr>
nnoremap ç :vertical copen<cr>:vertical resize 5<cr>:wincmd h<cr>:silent AsyncRun make build<cr>

autocmd BufWritePost *.tex :AsyncRun make build
set conceallevel=2
hi Conceal guifg=#719cd6

autocmd Syntax * syn match TexThereFore /\\therefore/ conceal cchar=∴
:silent Copilot disable


let &cpo = s:save_cpo
unlet s:save_cpo
