function! interval_line_number#enable() abort
    if g:interval_line_number#use_custom && !exists('g:interval_line_number#custom_interval')
        let g:interval_line_number#custom_interval = interval_line_number#fibonacci()
    endif

    let l:ui_type = ['gui', 'cterm']
    let l:fg_bg = ['fg', 'bg']

    let s:linenr_color = {}
    for l:type in l:ui_type
        let s:linenr_color[l:type] = {}
        for l:fb in l:fg_bg
            let s:linenr_color[l:type][l:fb] = synIDattr(synIDtrans(hlID('LineNr')), l:fb, l:type)
            if s:linenr_color[l:type][l:fb] ==# ''
                let s:linenr_color[l:type][l:fb] = 'NONE'
            endif
        endfor
    endfor

    if !hlexists('DimLineNr')
        execute 'highlight DimLineNr'
            \ 'guifg='   s:linenr_color.gui.bg   'guibg='   s:linenr_color.gui.bg
            \ 'ctermfg=' s:linenr_color.cterm.bg 'ctermbg=' s:linenr_color.cterm.bg
    endif

    let s:dim_linenr_color = {}
    for l:type in l:ui_type
        let s:dim_linenr_color[l:type] = {}
        for l:fb in l:fg_bg
            let s:dim_linenr_color[l:type][l:fb] = synIDattr(synIDtrans(hlID('DimLineNr')), l:fb, l:type)
            if s:dim_linenr_color[l:type][l:fb] ==# ''
                let s:dim_linenr_color[l:type][l:fb] = 'NONE'
            endif
        endfor
    endfor

    if s:dim_linenr_color.cterm.fg ==# 'NONE'
        let s:dim_linenr_color.cterm.fg = 0
    endif

    if s:dim_linenr_color.gui.fg ==# 'NONE'
        let s:dim_linenr_color.gui.fg = 'Black'
    endif

    if !hlexists('HighlightedLineNr')
        execute 'highlight HighlightedLineNr'
            \ 'guifg='   s:linenr_color.gui.fg   'guibg='   s:linenr_color.gui.bg
            \ 'ctermfg=' s:linenr_color.cterm.fg 'ctermbg=' s:linenr_color.cterm.bg
    endif

    execute 'highlight LineNr'
        \ 'guifg='   s:dim_linenr_color.gui.fg   'guibg='   s:dim_linenr_color.gui.bg
        \ 'ctermfg=' s:dim_linenr_color.cterm.fg 'ctermbg=' s:dim_linenr_color.cterm.bg

    call sign_define('LineNumberInterval', {
        \ 'numhl': 'HighlightedLineNr'
        \ })

    augroup LineNumberInterval
        autocmd!
        autocmd BufRead,BufNewFile,CursorMoved,CursorMovedI * call interval_line_number#update()
    augroup END

    call interval_line_number#update()
    redraw

    let s:enabled_interval_line_number = 1
endfunction

function! interval_line_number#disable() abort
    augroup LineNumberInterval
        autocmd!
    augroup END

    call sign_unplace('LineNumberGroup', {'buffer': bufname('%')})
    try
        call sign_undefine('LineNumberInterval')
    catch /E155: Unknown sign: LineNumberInterval/
    endtry

    if exists('s:linenr_color')
        execute 'highlight LineNr'
            \ 'guifg='   s:linenr_color.gui.fg   'guibg='   s:linenr_color.gui.bg
            \ 'ctermfg=' s:linenr_color.cterm.fg 'ctermbg=' s:linenr_color.cterm.bg
    endif

    let s:enabled_interval_line_number = 0
endfunction

function! interval_line_number#toggle() abort
    if exists('s:enabled_interval_line_number') && s:enabled_interval_line_number
        call interval_line_number#disable()
    else
        call interval_line_number#enable()
    endif
endfunction

function! interval_line_number#update() abort
    call sign_unplace('LineNumberGroup', {'buffer': bufname('%')})

    if &relativenumber
        if g:interval_line_number#use_custom
            let l:lnum = line('.') - 1
            let l:numfold = 0
            while l:lnum >= line('w0')
                let l:numfolddelta = 0
                if foldclosed(l:lnum) != -1
                    let l:numfolddelta = l:lnum - foldclosed(l:lnum)
                    let l:numfold += l:numfolddelta
                endif
                if match(g:interval_line_number#custom_interval, '^' . (line('.') - l:lnum - l:numfold) . '$') != -1
                    call sign_place('', 'LineNumberGroup', 'LineNumberInterval', bufname('%'), {'lnum': l:lnum})
                endif
                let l:lnum -= 1 + l:numfolddelta
            endwhile

            let l:lnum = line('.') + 1
            if foldclosed(line('.')) != -1
                let l:numfold = 1
            else
                let l:numfold = 0
            endif
            while l:lnum <= line('w$')
                let l:numfolddelta = 0
                if foldclosedend(l:lnum) != -1
                    let l:numfolddelta = foldclosedend(l:lnum) - l:lnum
                    let l:numfold += l:numfolddelta
                endif
                if match(g:interval_line_number#custom_interval, '^' . (l:lnum - line('.') - l:numfold) . '$') != -1
                    call sign_place('', 'LineNumberGroup', 'LineNumberInterval', bufname('%'), {'lnum': l:lnum})
                endif
                let l:lnum += 1 + l:numfolddelta
            endwhile

        else
            let l:lnum = line('.') - 1
            let l:numfold = 0
            while l:lnum >= line('w0')
                let l:numfolddelta = 0
                if foldclosed(l:lnum) != -1
                    let l:numfolddelta = l:lnum - foldclosed(l:lnum)
                    let l:numfold += l:numfolddelta
                endif
                if (line('.') - l:lnum - l:numfold) % g:interval_line_number == 0
                    call sign_place('', 'LineNumberGroup', 'LineNumberInterval', bufname('%'), {'lnum': l:lnum})
                endif
                let l:lnum -= 1 + l:numfolddelta
            endwhile

            let l:lnum = line('.') + 1
            if foldclosed(line('.')) != -1
                let l:numfold = 1
            else
                let l:numfold = 0
            endif
            while l:lnum <= line('w$')
                let l:numfolddelta = 0
                if foldclosedend(l:lnum) != -1
                    let l:numfolddelta = foldclosedend(l:lnum) - l:lnum
                    let l:numfold += l:numfolddelta
                endif
                if (l:lnum - line('.') - l:numfold) % g:interval_line_number == 0
                    call sign_place('', 'LineNumberGroup', 'LineNumberInterval', bufname('%'), {'lnum': l:lnum})
                endif
                let l:lnum += 1 + l:numfolddelta
            endwhile
        endif

    elseif &number
        let l:lnum = line('w0')
        while l:lnum <= line('w$')
            if l:lnum % g:interval_line_number == 0 && l:lnum != line('.')
                call sign_place('', 'LineNumberGroup', 'LineNumberInterval', bufname('%'), {'lnum': l:lnum})
            endif
            let l:lnum += 1
        endwhile

    endif
endfunction

function! interval_line_number#fibonacci() abort
    let l:fibonacci = [1, 2]
    while l:fibonacci[-1] <= &lines
        call add(l:fibonacci, (l:fibonacci[-1] + l:fibonacci[-2]))
    endwhile

    return l:fibonacci
endfunction
