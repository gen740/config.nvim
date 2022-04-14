if exists('b:my_c_ftplugin')
    finish
endif

nnoremap <m-r> :vertical copen<cr>:vertical resize 40<cr>:wincmd h<cr>:AsyncRun make run<cr>
nnoremap <m-c> :vertical copen<cr>:vertical resize 40<cr>:wincmd h<cr>:AsyncRun make build<cr>
nnoremap <m-s> :AsyncStop<cr>

" vint: -ProhibitAbbreviationOption
let b:my_c_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

let g:neomake_make_maker = {
    \ 'exe': 'make',
    \ 'args': ['run'],
    \ }

let g:neomake_build_maker = {
      \ 'exe': 'make',
      \ 'args': ['debug'],
      \ }

setlocal tabstop=2 softtabstop=2 shiftwidth=2

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption
