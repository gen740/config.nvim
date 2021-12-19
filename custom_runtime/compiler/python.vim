if exists('current_compiler')
  finish
endif
let current_compiler = 'python'

" vint: -ProhibitAbbreviationOption
let s:cpo_save = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

CompilerSet errorformat=
      \%*\\sFile\ \"%f\"\\,\ line\ %l\\,\ %m,
      \%*\\sFile\ \"%f\"\\,\ line\ %l,
CompilerSet makeprg=python3\ %

" vint: -ProhibitAbbreviationOption
let &cpo = s:cpo_save
unlet s:cpo_save
" vint: +ProhibitAbbreviationOption
