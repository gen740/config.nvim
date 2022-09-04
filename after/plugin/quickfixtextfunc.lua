vim.opt.qftf = "CustomQuickfixTextFunc"
vim.cmd [=[
func CustomQuickfixTextFunc(info)
    let l = []
    let qflist = getqflist({'id' : a:info.id, 'items' : 1}).items
    for d in qflist
        if !d.valid
            call add(l, '┃ ' . d.text)
            continue
        endif
        if d.type == "e"
            call add(l, ' ' . bufname(d.bufnr) . '|' . d.lnum . '|' . d.text)
        elseif d.type == "w"
            call add(l, ' ' . bufname(d.bufnr) . '|' . d.lnum . '|' . d.text)
        else
            call add(l, ' ' . bufname(d.bufnr) . '|' . d.lnum . '|' . d.text)
        endif
    endfor
    if len(l) == 0
        return []
    endif
    return l
endfunc
]=]
