require("genF.init")
require("genF.plugins")

vim.cmd([[source ~/.config/nvim/foldingtxt.vim]])
vim.cmd([[source ~/home/Labo/Project/Preview.nvim/debug.vim]])
vim.cmd([[

set conceallevel=0
let g:tex_conceal=''
set concealcursor="invc"
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" highlight QuickScopeSecondary guifg=lightblue gui=underline
highlight QuickScopePrimary guifg='#ffe37e' gui=underline
" let g:denops#debug = 1

" Preview.vim
" ========================================================================
let g:preview_DEBUG = v:true
let g:preview_auto_start = 1
let g:preview_theme = 'disable'
let g:preview_math = 'MathJax'

let g:preview_custom_ft = ['md', 'txt']
let g:preview_custom_css_dict = {'md': 'main.css', 'txt': 'main.css'}

let g:preview_enable_gfm = 1
let g:preview_enable_emoji = 1
let g:preview_enable_rawHTML = 1
let g:preview_enable_notify = 1
let g:preview_enable_plantuml = 1
let g:preview_enable_mermaid = 1

let JpFormatCursorMovedI = 1
" ========================================================================
]])
