function! OpenExecuteWindow(name)
    " 空のバッファを作りコマンドの出力を流し込めるようにします。
    " vimのquickfixを使用することを推奨します。
    silent execute "update | edit"
    " get file path of current file
    let s:output_buffer_name = a:name
    let s:output_buffer_filetype = "output"
    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'sp new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif
    silent execute "setlocal filetype=" . s:output_buffer_filetype
    silent execute "resize 12"
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""
    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _
endfunction

function custom#SetWindows()
    let s:cur_win_id = win_getid()
    let g:cur_win_height = winheight(0)
    let g:cur_win_width = winwidth(0)
    silent execute 'vertical resize' . g:cur_win_width / 7
    call win_gotoid(s:cur_win_id)
    call custom#ChooseTerm("Term-Slider", 1, 1)
    :Fern %:h -drawer -toggle
    call win_gotoid(s:cur_win_id)
    silent execute 'resize' . g:cur_win_height*3/4
endfunction

function custom#AlignTable()
    :Tabular /|/
endfunction

function! custom#ChooseTerm(termname, slider, bottom)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    let g:cur_win_height = winheight(0)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #" 
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            if a:bottom == 0
                :exe "topleft split"
            else
                :exe "botright split"
            endif
            :exe "resize " . g:cur_win_height * 2 / 5
        endif
        :exe "buffer " . a:termname
        :exe "setlocal nobuflisted"
    else
        " buffer is not loaded, create
        if a:slider
            if a:bottom == 0
                :exe "topleft split"
            else
                :exe "botright split"
            endif
            :exe "resize " . g:cur_win_height * 2 / 5
        endif
        :terminal
        :exe "f " a:termname
        :exe "setlocal nobuflisted"
    endif
endfunction

function! custom#change_ime(keycode)
    let OSTYPE = system('uname')
    if OSTYPE == "Darwin\n"
        " Mac OSの時はapple scriptを通じて英数キーを送る
        if a:keycode == 'kana'
            :silent !osascript -e 'tell application "System Events"' -e 'key code 104' -e 'end tell'
        elseif a:keycode == 'eisu'
            :silent !osascript -e 'tell application "System Events"' -e 'key code 102' -e 'end tell'
        endif
    endif
endfunction

function! custom#japanese(key)
    let OSTYPE = system('uname')
    if OSTYPE == "Darwin\n"
        :silent !osascript -e 'tell application "System Events"' -e 'key code 104' -e 'end tell'
        let s:keycode = getchar()
        let s:keystr = nr2char(s:keycode)
        call feedkeys(a:key . s:keystr)
        :silent !osascript -e 'tell application "System Events"' -e 'key code 102' -e 'end tell'
    endif
endfunction

function! custom#japanese_search(key)
    let OSTYPE = system('uname')
    if OSTYPE == "Darwin\n"
        :silent !osascript -e 'tell application "System Events"' -e 'key code 104' -e 'end tell'
        let s:keystr = input(a:key)
        call feedkeys(a:key . s:keystr . '')
        :silent !osascript -e 'tell application "System Events"' -e 'key code 102' -e 'end tell'
    endif
endfunction

