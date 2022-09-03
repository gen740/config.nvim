if exists('g:my_custom_plugin')
    finish
endif

let g:my_custom_plugin = 1
let s:save_cpo = &cpoptions
set cpoptions&vim

command! VimShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')

let &cpoptions = s:save_cpo
unlet s:save_cpo
