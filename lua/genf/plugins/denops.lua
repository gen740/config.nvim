vim.cmd[[
  imap <C-j> <Plug>(skkeleton-enable)
  cmap <C-j> <Plug>(skkeleton-enable)
  tmap <C-j> <Plug>(skkeleton-enable)

  call skkeleton#initialize()
  call skkeleton#config({
    \   'eggLikeNewline': v:true,
    \   'globalDictionaries': [
    \     '/Users/gen/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.L',
    \     '/Users/gen/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.JIS2',
    \     '/Users/gen/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.jinmei',
    \     '/Users/gen/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/SKK-JISYO.JIS2004'
    \   ],
    \   'userDictionary': '/Users/gen/Library/Containers/net.mtgto.inputmethod.macSKK/Data/Documents/Dictionaries/skk-jisyo.utf8'
    \ })
]]
