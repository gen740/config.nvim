if exists('b:my_python_ftplugin')
    finish
endif
let b:my_python_ftplugin = 1

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

nnoremap <m-r> <cmd>AsyncRun make run<cr>
nnoremap <m-c> <cmd>AsyncRun make build<cr>

setlocal tabstop=4 softtabstop=4 shiftwidth=4
compiler python

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption
