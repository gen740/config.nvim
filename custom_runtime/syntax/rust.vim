if exists("g:my_rust_syntax")
    finish
endif
let g:my_rust_syntax = 1
let s:save_cpo = &cpo
set cpo&vim

" autocmd Syntax * syn match ArrowHead contained ">" conceal cchar=▶
" autocmd Syntax * syn match ArrowTail contained "-" conceal cchar=─
" autocmd Syntax * syn match ArrowFull "->" contains=ArrowHead,ArrowTail
autocmd Syntax * syn match ArrowFull /->/ conceal cchar=⇒
" autocmd Syntax * syntax match RustFunction /\<fn\>/ conceal cchar=

"" →


let &cpo = s:save_cpo
unlet s:save_cpo
