" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "myColor"
hi Normal                       guifg=#eeeeee   guibg=none
hi Comment      term=bold       guifg=#555555
hi Constant     term=underline  guifg=#999999
hi Special      term=bold       guifg=#ffffff
hi Identifier   term=underline  guifg=#888888
hi Statement    term=bold       guifg=#ffffff   gui=bold
hi PreProc      term=underline  guifg=#606060
hi Type         term=underline  guifg=#b0b0b0   gui=bold
hi Function     term=bold       guifg=White
hi Repeat       term=underline  guifg=white
hi Operator                     guifg=#666666
hi Ignore                       guifg=bg
hi Error        term=reverse    guifg=White     guibg=Red 
hi Todo         term=standout   guifg=Blue      guibg=Yellow
hi Conceal                      guifg=#222222   guibg=none
hi SpecialKey                   guifg=#222222
hi NonText                      guifg=#444444
hi SignColumn                   guifg=#ffffff   guibg=none
hi VertSplit    cterm=none      guifg=#808080   guibg=none    gui=none  
hi CursorLine                   guifg=none      guibg=#303030
hi ColorColumn                  guifg=none      guibg=#303030
hi Pmenu                        guifg=#aaaaaa   guibg=#202020
hi PmenuSel                     guifg=#202020   guibg=#aaaaaa
hi LineNr                       guifg=#909090   guibg=none
hi CursorLineNr                 guifg=#dddddd   guibg=none
" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String          Constant
hi link Character       Constant
hi link Number          Constant
hi link Boolean         Constant
hi link Float           Number
hi link Conditional     Repeat
hi link Label           Statement
hi link Keyword         Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link Delimiter       Special
hi link SpecialComment  Special
hi link Debug           Special

