if exists("g:my_cpp_ftplugin")
    finish
endif
let g:my_cpp_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

nnoremap <m-r> :vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>:AsyncRun make run<cr>
nnoremap <m-c> :vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>:AsyncRun make build<cr>

let g:neomake_make_maker = {
    \ 'exe': 'make',
    \ 'args': ['run'],
    \ }

let g:neomake_build_maker = {
    \ 'exe': 'make',
    \ 'args': ['debug'],
    \ }

setlocal tabstop=2 softtabstop=2 shiftwidth=2
setlocal conceallevel=2 concealcursor=nvic

autocmd Syntax * highlight Conceal guifg=Normal

" function s:set_Arrow_conceal() abort
"     syn match ArrowHead contained ">" conceal cchar=▶
"     syn match ArrowTail contained "-" conceal cchar=─
"     syn match ArrowFull "->" contains=ArrowHead,ArrowTail
" endfunction
" autocmd Syntax * call s:set_Arrow_conceal()

" autocmd Syntax * syn match ArrowFull /->/ conceal cchar=→


let &cpo = s:save_cpo
unlet s:save_cpo