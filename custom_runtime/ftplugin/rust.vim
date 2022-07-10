if exists('b:my_rust_ftplugin')
    finish
endif
let b:my_rust_ftplugin = 1

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

nnoremap <m-r> <cmd>AsyncRun cargo run<cr>
nnoremap <m-c> <cmd>AsyncRun cargo build<cr>
nnoremap <m-s> <cmd>AsyncStop<cr>

setlocal tabstop=4 softtabstop=4 shiftwidth=4
setlocal makeprg=cargo
compiler cargo

" autocmd Syntax * syn match ArrowFull /->/ conceal cchar=⇒
scriptencoding utf-8
syn match ArrowHead contained ">" conceal cchar=▶
syn match ArrowTail contained "-" conceal cchar=─
syn match ArrowFull "->" contains=ArrowHead,ArrowTail

augroup RUST_CUSTOM_CONCEAL
  autocmd Syntax * highlight Conceal guifg=Normal
augroup END

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption
