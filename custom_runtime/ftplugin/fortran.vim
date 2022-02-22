if exists('b:my_fortran_ftplugin')
    finish
endif

let b:my_cpp_ftplugin = 1
let s:save_cpo = &cpoptions
set cpoptions&vim

nnoremap <m-r> :vertical copen<cr>:vertical resize 40<cr>:wincmd h<cr>:AsyncRun make run<cr>
nnoremap <m-c> :vertical copen<cr>:vertical resize 40<cr>:wincmd h<cr>:AsyncRun make build<cr>
nnoremap <m-s> :AsyncStop<cr>

let g:neomake_make_maker = {
      \ 'exe': 'make',
      \ 'args': ['run'],
      \ }

let g:neomake_build_maker = {
      \ 'exe': 'make',
      \ 'args': ['debug'],
      \ }

setlocal tabstop=3 softtabstop=3 shiftwidth=3
setlocal conceallevel=2 concealcursor=nvic

augroup Cpp_conceal
  autocmd Syntax * highlight Conceal guifg=Normal
augroup END

scriptencoding utf-8
" function s:set_Arrow_conceal() abort
"     syn match ArrowHead contained ">" conceal cchar=▶
"     syn match ArrowTail contained "-" conceal cchar=─
"     syn match ArrowFull "->" contains=ArrowHead,ArrowTail
" endfunction
" autocmd Syntax * call s:set_Arrow_conceal()

" autocmd Syntax * syn match ArrowFull /->/ conceal cchar=→

let &cpoptions = s:save_cpo
unlet s:save_cpo
