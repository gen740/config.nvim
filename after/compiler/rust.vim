" Vim compiler file
" Compiler:         Cargo Compiler
" Maintainer:       Damien Radtke <damienradtke@gmail.com>
" Latest Revision:  2014 Sep 24
" For bugs, patches and license go to https://github.com/rust-lang/rust.vim

if exists('current_compiler')
    finish
endif
runtime compiler/rustc.vim
let current_compiler = "rust"

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

CompilerSet makeprg=cargo
" CompilerSet errorformat=
"             \%-G,
"             \%-Gerror:\ aborting\ %.%#,
"             \%-Gerror:\ Could\ not\ compile\ %.%#,
"             \%-Gnote:\ Run\ with\ \`RUST_BACKTRACE=%.%#,
"             \%-Gerror:\ test\ failed%.%#,
"             \%-G%\\s%#Downloading%.%#,
"             \%-G%\\s%#Compiling%.%#,
"             \%-G%\\s%#Finished%.%#,
"             \%-G%\\s%#error:\ Could\ not\ compile\ %.%#,
"             \%-G%\\s%#To\ learn\ more\\,%.%#,
"             \%Eerror:\ %m,
"             \%Eerror[E%n]:\ %m,
"             \%Wwarning:\ %m,
"             \%Inote:\ %m,
"             \%m\\,\ %f:%l:%c,
"             \%C\ %#-->\ %f:%l:%c,
"             \%E\ \ left:%m,%C\ right:%m\ %f:%l:%c,%Z
"             \%.%#panicked\ at\ \\'%m\\'\\,\ %f:%l:%c
"
runtime compiler/rustc.vim

CompilerSet errorformat+=
            \%-G%\\s%#Downloading%.%#,
            \%-G%\\s%#Compiling%.%#,
            \%-G%\\s%#Finished%.%#,
            \%-G%\\s%#error:\ Could\ not\ compile\ %.%#,
            \%-G%\\s%#To\ learn\ more\\,%.%#,
            \%-Gnote:\ Run\ with\ \`RUST_BACKTRACE=%.%#,
            \%.%#panicked\ at\ \\'%m\\'\\,\ %f:%l:%c

" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption

" vim: set et sw=4 sts=4 ts=8:
