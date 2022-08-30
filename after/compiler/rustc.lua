vim.cmd([[
if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

if get(g:, 'rustc_makeprg_no_percent', 0)
    CompilerSet makeprg=rustc
else
    if has('patch-7.4.191')
      CompilerSet makeprg=rustc\ \%:S
    else
      CompilerSet makeprg=rustc\ \"%\"
    endif
endif

" New errorformat (after nightly 2016/08/10)
CompilerSet errorformat=
            \%-G,
            \%-Gerror:\ aborting\ %.%#,
            \%-Gerror:\ Could\ not\ compile\ %.%#,
            \%Eerror:\ %m,
            \%Eerror[E%n]:\ %m,
            \%Wwarning:\ %m,
            \%Inote:\ %m,
            \%C\ %#-->\ %f:%l:%c,
            \%E\ \ left:%m,%C\ right:%m\ %f:%l:%c,%Z

" Old errorformat (before nightly 2016/08/10)
CompilerSet errorformat+=
            \%f:%l:%c:\ %t%*[^:]:\ %m,
            \%f:%l:%c:\ %*\\d:%*\\d\ %t%*[^:]:\ %m,
            \%-G%f:%l\ %s,
            \%-G%*[\ ]^,
            \%-G%*[\ ]^%*[~],
            \%-G%*[\ ]...
]])
