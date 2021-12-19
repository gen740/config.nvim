if exists('b:my_qf_ftplugin')
    finish
endif
let b:my_qf_ftplugin = 1

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

augroup CUSTOM_QF_OPTION
  autocmd FileType qf set nobuflisted
augroup END

" setlocal wrap nobuflisted
setlocal nocursorline nonu norelativenumber

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption
