-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « Vim Options »                                     │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
vim.g.python3_host_prog='~/.pyenv/versions/neovim-3/bin/python'
vim.g.python_host_prog='~/.pyenv/versions/neovim-2/bin/python'

vim.g.enc = 'utf-8'
vim.g.fileencoding = 'utf-8'
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.clipboard = 'unnamed'
vim.opt.colorcolumn = '100'
vim.opt.concealcursor= 'c'
vim.opt.conceallevel = 1
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.foldcolumn = '0'
vim.opt.foldenable = true
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 999
vim.opt.foldmethod = 'expr'
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = [[tab:»-,conceal:◇,trail:▒,extends:»,precedes:«,nbsp:%]] -- ,eol:↲│
vim.opt.modeline = true
vim.opt.mouse:append('a')
vim.opt.number = true
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.runtimepath:append('~/.config/nvim/custom_runtime')
vim.opt.scrolloff = 8
vim.opt.shada = [['1000,f1,<500,:500,@500,/500]]
vim.opt.shiftwidth = 4
vim.opt.shortmess = 'acostTWI'
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undodir=[[/Users/fujimotogen/.vim/undo]]
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 300
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.wrap = false
-- vim.opt.backup = false
-- vim.opt.backupext = '.bak'
-- vim.opt.completeopt = "menuone,noselect"
-- vim.opt.display = 'lastline'
-- vim.opt.iskeyword:remove(':')
-- vim.opt.matchtime = 5
-- vim.opt.path:append([[**]])
-- vim.opt.showmatch = true
-- vim.opt.tags = '.tags;~'
-- vim.opt.wildmenu = true
-- vim.opt.wildmode:append([[full]])
-- vim.opt.wildmode:append([[longest]])
-- vim.opt.writebackup = false

-- forNeovide
vim.o.guifont = 'HackGen35Nerd Console:h13'
vim.g.neovide_cursor_vfx_mode = 'pixiedust'
vim.g.neovide_fullscreen = 1
vim.g.neovide_cursor_vfx_particle_density = 50
vim.g.neovide_transparency=0.8
vim.g.neovide_cursor_vfx_particle_lifetime=5
vim.g.neovide_cursor_animation_length=0.02
vim.g.neovide_cursor_trail_length=100

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « Key mappings »                                    │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

vim.cmd [[let mapleader = "\<Space>"]]
vim.api.nvim_set_keymap('i', '<c-[>', [[<c-[>:silent call custom#change_ime('eisu')<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<esc>', [[<esc>:silent call custom#change_ime('eisu')<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>rb', ':silent AsyncRun make build<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-e>', '3<c-e>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-n>', ':BufferLineCycleNext<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<c-p>', ':BufferLineCyclePrev<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<c-q>', ':NvimTreeToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<c-y>', '3<c-y>', {noremap = true})
vim.api.nvim_set_keymap('n', '<down>',  ':resize +2<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><leader>', '/<++><cr>:nohl<cr>c4l', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?',  ':vertical split<cr>:view ~/.config/nvim/keymap.md<cr>:setlocal nomodifiable nobuflisted<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>aa', ':Git add --all<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>am', ':silent Git commit<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ap', ':Git push origin HEAD<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bl', ':Telescope current_buffer_fuzzy_find<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cp', ':cp<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cn', ':cn<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', ':Telescope git_branches<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gf', ':Telescope git_files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>mc', ':BufferLinePickClose<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>mm', ':BufferLinePick<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>mn', ':BufferLineMoveNext<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>mp', ':BufferLineMovePrev<cr>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>qf', ':copen<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ss', ':silent !open https://google.com -a /Applications/Safari.app<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ta', ':TagbarToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tf', ':Telescope find_files<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>tn', ':Telescope file_browser<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ts', ':Telescope', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ut', ':UndotreeToggle<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>vq', ':vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<left>',  ':vertical resize -2<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<m-c>', ':vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>:Neomake! build<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<m-r>', ':vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>:Neomake! make<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<right>', ':vertical resize +2<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<up>',    ':resize -2<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'S', '<Plug>(easymotion-overwin-line)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', 'ga', '<plug>(EasyAlign)', {noremap = false})
vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)', {noremap = false, silent = true})
vim.api.nvim_set_keymap('t', '<m-b>', [[<c-\><c-n>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<down>', [[:m '>+1<cr>gv=cv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader>s', ':sort<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<up>', [[:m '>-2<cr>gv=cv]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'ga', '<plug>(EasyAlign)', {noremap = false})

vim.api.nvim_set_keymap('n', '<leader>bo',   [[:!source ~/.config/zsh/custom_func.zsh && blackout<cr><cr><C-l>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cbin', [[:!source ~/.config/zsh/custom_func.zsh && change<cr><cr><C-l>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>cbif', [[:!source ~/.config/zsh/custom_func.zsh && change_f<cr><cr><C-l>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', 'q:', [[<nop>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'Q', [[<nop>]], {noremap = true, silent = true})



-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « AutoCommands »                                    │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

vim.cmd [[autocmd WinEnter, BufEnter,FocusGained,InsertLeave * set cursorline]]
vim.cmd [[autocmd BufLeave,FocusLost,InsertEnter * set nocursorline]]
vim.cmd [[autocmd ColorScheme * hi Normal guibg=none]]
vim.cmd [[autocmd ColorScheme * hi SignColumn guibg=none]]
vim.cmd [[autocmd ColorScheme * hi EndOfBuffer guifg=#222222]]
vim.cmd [[autocmd ColorScheme * hi VertSplit guibg=none]]
vim.cmd [[autocmd ColorScheme * hi GitSignsAdd guifg=lightblue]] -- 9999ff
vim.cmd [[autocmd ColorScheme * hi CmpDocumentation guibg=none]]
vim.cmd [[autocmd ColorScheme * hi CmpDocumentationBorder guibg=none]]

vim.cmd [[autocmd ColorScheme * hi EasyMotionTarget  guifg=yellow]]

vim.cmd [[autocmd ColorScheme * hi GitSignsAdd      guibg=none  guifg=lightblue]]
vim.cmd [[autocmd ColorScheme * hi GitSignsAddNr    guibg=none  guifg=lightblue]]
vim.cmd [[autocmd ColorScheme * hi GitSignsAddLn    guibg=none  guifg=lightblue]]
vim.cmd [[autocmd ColorScheme * hi GitSignsChange   guibg=none  guifg=lightgreen]]
vim.cmd [[autocmd ColorScheme * hi GitSignsChangeNr guibg=none  guifg=lightgreen]]
vim.cmd [[autocmd ColorScheme * hi GitSignsChangeLn guibg=none  guifg=lightgreen]]
vim.cmd [[autocmd ColorScheme * hi GitSignsDelete   guibg=none  guifg=red]]
vim.cmd [[autocmd ColorScheme * hi GitSignsDeleteNr guibg=none  guifg=red]]
vim.cmd [[autocmd ColorScheme * hi GitSignsDeleteLn guibg=none  guifg=red]]

vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]
-- vim.cmd [[au BufWinLeave *.* silent! mkview]]
-- vim.cmd [[au BufWinEnter *.* silent! loadview]]

vim.cmd [[autocmd FileType lua setlocal sw=2]]
vim.cmd [[autocmd FileType cpp setlocal sw=2]]

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « Folding Configurations »                                │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

vim.cmd [[
if has("folding")
  set foldtext=MyFoldText()
  function! MyFoldText()
    " for now, just don't try if version isn't 7 or higher
    if v:version < 701
      return foldtext()
    endif
    " clear fold from fillchars to set it up the way we want later
    let &l:fillchars = substitute(&l:fillchars,',\?fold:.','','gi')
    let l:numwidth = (v:version < 701 ? 8 : &numberwidth)
    if &fdm=='diff'
      let l:linetext=''
      let l:foldtext='---------- '.(v:foldend-v:foldstart+1).' lines the same ----------'
      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strwidth(line('$'))+1, l:numwidth) : 0)
      let l:align = (l:align / 2) + (strwidth(l:foldtext)/2)
      " note trailing space on next line
      setlocal fillchars+=fold:\
    elseif !exists('b:foldpat') || b:foldpat==0
      let l:foldtext = '┈ '.(v:foldend-v:foldstart).' ﲐ'.' ┠'
      let l:endofline = 106 " (&textwidth>0 ? &textwidth : 100 + 6)
      let l:linetext = strpart(getline(v:foldstart),0,l:endofline-strwidth(l:foldtext))
      let l:align = l:endofline-strwidth(l:linetext)
      setlocal fillchars+=fold:─ " 空白
    elseif b:foldpat==1
      let l:align = winwidth(0)-&foldcolumn-(&nu ? Max(strwidth(line('$'))+1, l:numwidth) : 0)
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
autocmd FileType vim setlocal foldmethod=marker
" autocmd FileType zsh setlocal foldmethod=marker
autocmd BufRead,BufNewFile *.zprofile setlocal foldmethod=marker
set viewoptions-=options
autocmd BufRead,BufNewFile * hi Folded guifg=#928374 guibg=none gui=undercurl
]]

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- vim:set foldmethod=marker:
