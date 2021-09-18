if exists("g:my_tex_ftplugin")
    finish
endif
let g:my_tex_ftplugin = 1
let s:save_cpo = &cpo
set cpo&vim

nmap <Leader>r <Leader>ll<Leader>lv
setlocal filetype=tex
nnoremap <C-q> <Plug>Tex_FastEnvironmentInsert
vnoremap <C-q> <Plug>Tex_FastEnvironmentInsert

let &cpo = s:save_cpo
unlet s:save_cpo
