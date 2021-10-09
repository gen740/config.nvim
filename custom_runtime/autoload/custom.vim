function! custom#change_ime(keycode)
    let OSTYPE = system('uname')
    if OSTYPE == "Darwin\n"
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

function! custom#say(text)
  let OSTYPE = system('uname')
  if OSTYPE == "Darwin\n"
    :AsyncRun
    :call asyncrun#run("", [], 'say -v Kyoko ' . a:text)
  endif
endfunction

function! custom#quickfik(expr)
  :silent cexpr system(a:expr)
endfunction
