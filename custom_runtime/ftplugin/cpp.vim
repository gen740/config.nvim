if exists('b:my_cpp_ftplugin')
    finish
endif

let b:my_cpp_ftplugin = 1
let s:save_cpo = &cpoptions
set cpoptions&vim

nnoremap <m-r> <cmd>AsyncRun make nvim_run<cr>
nnoremap <m-c> <cmd>AsyncRun make nvim_build<cr>
nnoremap <m-s> <cmd>AsyncStop<cr>

setlocal tabstop=2 softtabstop=2 shiftwidth=2
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
