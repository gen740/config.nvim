if exists("current_compiler")
    finish
endif
let current_compiler = "rustc"

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

CompilerSet errorformat=
            \%-G%f:%s:,
            \%-GFAILED:%.%#,
            \%-Gmake:\ %.%#,
            \%-Gninja:\ %.%#,
            \%f:%l:%c:\ %trror:\ %m,
            \%f:%l:%c:\ %tarning:\ %m,
            \%f:%l:\ %trror:\ %m,
            \%f:%l:\ %tarning:\ %m,
            \%f:%l:\ %m
            " \%f:%l:%c:

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption

" vim: set et sw=4 sts=4 ts=8:
