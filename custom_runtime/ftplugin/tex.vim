if exists('b:my_tex_ftplugin')
    finish
endif
let b:my_tex_ftplugin = 1

" vint: -ProhibitAbbreviationOption
let s:save_cpo = &cpo
set cpo&vim
" vint: +ProhibitAbbreviationOption

nnoremap <m-r> :silent AsyncRun make run<cr>
nnoremap <m-c> :vertical copen<cr>:vertical resize 5<cr>:wincmd h<cr>:silent AsyncRun make build<cr>
nnoremap ® :silent AsyncRun make run<cr>
nnoremap ç :vertical copen<cr>:vertical resize 5<cr>:wincmd h<cr>:silent AsyncRun make build<cr>

set conceallevel=1
let g:tex_conceal = ''
set concealcursor="n"
hi Conceal guifg=#719cd6

scriptencoding utf-8
augroup CUSTOM_TEX_AUCMD
  autocmd BufWritePost *.tex :AsyncRun make build
  autocmd Syntax * syn match TexThereFore /\\therefore/ conceal cchar=∴
augroup END
" :silent Copilot disable


" vint: -ProhibitAbbreviationOption
let &cpo = s:save_cpo
unlet s:save_cpo
" vint: +ProhibitAbbreviationOption
