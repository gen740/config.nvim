
let s:DEBUG = v:false

let s:current_listchar_opt = 0

let s:listchar_opts = {
      \ 'eol': '↲',
      \ 'tab': '> ',
      \ 'space': '',
      \ 'trail': '▒',
      \ 'extends': '┈',
      \ 'precedes': '┈',
      \ 'conceal': '│',
      \ 'nbsp': '☠',
      \ }

" cal cylist#activate_listchars(crazy_option_set)
function cyclist#add_listchar_option_set(opts_dics, use_defaults) abort
  let to _add = deepcopy(a:opts_dics)
    " populate any missing keys with the default value from the first config.
  if a:use_defaults
    call extend(to_add, s:listchar_opts[0], "keep")
  endif

  call add(s:listchar_opts, a:opts_dics)

  return  len(s:listchar_opts)
endfunction

function cyclist#activate_lischars() abort
  let s:current_listchar_opt = a:index
  let listchar_mapped = join(map(
        \ items(filter(s:listchar_opts, {k, v -> v != ''})),
        \ { index, key -> printf("%s:%s", key[0], key[1]) }
        \ ), ',')

  if s:DEBUG
    echo 'mapped:'
    echo listchar_mapped
  endif

  let &listchars = listchar_mapped
endfunction

function cyclist#set_eol(index, chars) abort
  let s:listchar_opts.[a:index]eol = a:chars
  call cyclist#activate_lischars(a:index)
endfunction

function cyclist#set_tab(index, chars) abort
  let s:listchar_opts.[a:index]tab = a:chars
  call cyclist#activate_lischars(a:index)
endfunction

function cyclist#set_space(index, chars) abort
  let s:listchar_opts.[a:index]space = a:chars
  call cyclist#activate_lischars(a:index)
endfunction

function cyclist#set_trail(index, chars) abort
  let s:listchar_opts.[a:index]trail = a:chars
  call cyclist#activate_lischars(a:index)
endfunction

function cyclist#set_extends(index, chars) abort
  let s:listchar_opts.[a:index]extends = a:chars
  call cyclist#activate_lischars(a:index)
endfunction

function cyclist#set_precedes(index, chars) abort
  let s:listchar_opts.[a:index]precedes = a:chars
  call cyclist#activate_lischars(a:index)
endfunction

function cyclist#set_conceal(index, chars) abort
  let s:listchar_opts.[a:index]conceal = a:chars
  call cyclist#activate_lischars(a:index)
endfunction

function cyclist#set_nbsp(index, chars) abort
  let s:listchar_opts.[a:index]nbsp = a:chars
  call cyclist#activate_lischars(a:index)
endfunction

call cyclist#activate_lischars()
