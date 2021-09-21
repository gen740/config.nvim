if exists("g:my_custom_plugin")
    finish
endif
let g:my_custom_plugin = 1
let s:save_cpo = &cpo
set cpo&vim

fun! s:trimUseless()
    let l:save = winsaveview()
    keeppatterns %s/\n\+$/\r/ge
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
    :silent w
endfun

command! TrimUselesses call s:trimUseless()
command! VimShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

let &cpo = s:save_cpo
unlet s:save_cpo
