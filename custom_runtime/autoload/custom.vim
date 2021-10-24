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

function! custom#say(text)
  let OSTYPE = system('uname')
  if OSTYPE == "Darwin\n"
    :call asyncrun#run("", [], 'say -v Kyoko ' . a:text)
  endif
endfunction

function! custom#quickfik(expr)
  :silent cexpr system(a:expr)
endfunction
