scriptencoding utf-8
if has('folding')
    set foldtext=MyFoldText()
    function! MyFoldText()
            " clear fold from fillchars to set it up the way we want later
        let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
        let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
        if &foldmethod==#'diff'
            let l:linetext=''
            let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' lines the same ----------'
            let l:align = winwidth(0)-&foldcolumn-(&number ? Max(strwidth(line('$'))+1, l:numwidth) : 0)
            let l:align = (l:align / 2) + (strwidth(l:foldtext)/2)
            " note trailing space on next line
            setlocal fillchars+=fold:\
        elseif !exists('b:foldpat') || b:foldpat==0
            let l:foldtext = '┈ '.(v:foldend-v:foldstart).' ﲐ'.' ┠'
            let l:endofline = 86 " (&textwidth>0 ? &textwidth : 80 + 6)
            let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strwidth(l:foldtext))
            let l:align = l:endofline-strwidth(l:linetext)
            setlocal fillchars+=fold:─ " 空白
        elseif b:foldpat==1
            let l:align = winwidth(0)-&foldcolumn-(&number ? Max(strwidth(line('$'))+1, l:numwidth) : 0)
            let l:foldtext = ' '.v:folddashes
            let l:linetext = substitute(getline(v:foldstart),'\s\+$','','')
            let l:linetext .= '▤ × '.(v:foldend-v:foldstart-1).' lines--- '
            let l:linetext .= substitute(getline(v:foldend),'^\s\+','','')
            let l:linetext = strpart(l:linetext,0,l:align-strwidth(l:foldtext))
            let l:align -= strwidth(l:linetext)
            setlocal fillchars+=fold:-
        endif
        return printf('%s%*s', l:linetext, l:align, l:foldtext)
    endfunction
endif

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

set viewoptions-=options
