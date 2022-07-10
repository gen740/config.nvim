vim.cmd([[
if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

if exists('g:cargo_makeprg_params')
    execute 'CompilerSet makeprg=cargo\ '.escape(g:cargo_makeprg_params, ' \|"').'\ $*'
else
    CompilerSet makeprg=cargo\ $*
endif

augroup RustCargoQuickFixHooks
    autocmd!
    autocmd QuickFixCmdPe make call cargo#quickfix#CmdPre()
    autocmd QuickFixCmdPost make call cargo#quickfix#CmdPost()
augroup END

CompilerSet errorformat+=
            \%-G%\\s%#Downloading%.%#,
            \%-G%\\s%#Compiling%.%#,
            \%-G%\\s%#Finished%.%#,
            \%-G%\\s%#error:\ Could\ not\ compile\ %.%#,
            \%-G%\\s%#To\ learn\ more\\,%.%#,
            \%-Gnote:\ Run\ with\ \`RUST_BACKTRACE=%.%#,
            \%.%#panicked\ at\ \\'%m\\'\\,\ %f:%l:%c
]])
