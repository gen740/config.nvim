if exists('current_compiler')
    finish
endif
runtime compiler/rustc.vim
let current_compiler = "python"

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

CompilerSet errorformat=
      \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
      \%*\\sFile\ \"%f\"\\,\ line\ %l,
      \%C\ %.%#,
      \%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,
      \%*[\ ]%f:%l:%c\ -\ %trror:\ %m,
      \%*[\ ]%f:%l:%c\ -\ %tarning:\ %m,
      \%*[\ ]%f:%l:%c\ -\ %tnformation:\ %m,
      \%f:%l:\ %trror:\ %m,
      \%f:%l:\ %tarning:\ %m,
      \%f:%l:\ %tnformation:\ %m,
      \%*[\ ]%f:%l:\ %m,
      \%Z%[%^\ ]%\\@=%m

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption

" vim: set et sw=4 sts=4 ts=8:
