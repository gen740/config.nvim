-- ┼─────────────────────────────────────────────────────────────────┼
-- │                       « Vim Options »                           │
-- ┼─────────────────────────────────────────────────────────────────┼
local handle = io.popen("which pyenv")
local result = handle:read("*a")
handle:close()

if result ~= "" then
    vim.g.python3_host_prog = "~/.pyenv/versions/neovim-3/bin/python"
    vim.g.python_host_prog = "~/.pyenv/versions/neovim-2/bin/python"
end

vim.g.enc = "utf-8"
vim.g.fileencoding = "utf-8"
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.clipboard = "unnamed"
vim.opt.colorcolumn = "80"
vim.opt.concealcursor = "vc"
vim.opt.conceallevel = 1
vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.foldenable = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 999
vim.opt.foldmethod = "expr"
vim.opt.gdefault = true
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = [[tab:»-,trail:▒,extends:»,precedes:«,nbsp:%]] -- ,eol:↲│,conceal:◇
vim.opt.modeline = true
vim.opt.mouse:append("a")
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.runtimepath:append("~/.config/nvim/custom_runtime")
vim.opt.scrolloff = 8
vim.opt.shada = [['1000,f1,<500,:500,@500,/500]]
-- vim.opt.shiftwidth = 2
vim.opt.shortmess = "acostTWI"
vim.opt.showcmd = true
vim.opt.showmode = false
-- vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
-- vim.opt.tabstop = 2
vim.opt.termguicolors = true
-- vim.opt.guicursor = 'a:block'

vim.opt.softtabstop = 2
vim.opt.undodir = os.getenv("HOME") .. [[/.vim/undo]]
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 750
vim.opt.whichwrap = "b,s,<,>,[,]"
vim.opt.wrap = false
-- vim.opt.path:append([[**]])
vim.opt.showmatch = true

vim.g.netrw_silent = true

vim.g.guifont = "FiraCode Nerd Font:h15"

-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                   « Key mappings »                          │
-- ┼─────────────────────────────────────────────────────────────────┼

vim.cmd([[let mapleader = "\<Space>"]])
-- vim.api.nvim_set_keymap('i', '<c-[>', [[<c-[>:silent call custom#change_ime('eisu')<cr>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('i', '<esc>', [[<esc>:silent call custom#change_ime('eisu')<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>rb", ":silent AsyncRun make build<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-e>", "3<c-e>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-n>", ":BufferLineCycleNext<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<c-p>", ":BufferLineCyclePrev<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<c-q>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-y>", "3<c-y>", { noremap = true })
vim.api.nvim_set_keymap("n", "<down>", ":resize +2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", "/<++><cr>:nohl<cr>c4l", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>?",
    ":vertical split<cr>:view ~/.config/nvim/keymap.md<cr>:setlocal nomodifiable nobuflisted<cr>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>bl",
    ":Telescope current_buffer_fuzzy_find<cr>",
    { noremap = false, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>cp", ":cp<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cn", ":cn<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gb", ":Telescope git_branches<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gf", ":Telescope git_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mc", ":BufferLinePickClose<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mm", ":BufferLinePick<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mn", ":BufferLineMoveNext<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mp", ":BufferLineMovePrev<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>co", ":copen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>ss",
    ":silent !open https://google.com -a /Applications/Safari.app<cr>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>ta", ":TagbarToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":Telescope file_browser<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":Telescope", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ut", ":UndotreeToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>vq",
    ":vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<left>", ":vertical resize -2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<m-c>",
    ":vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>:Neomake! build<cr>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<m-r>",
    ":vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>:Neomake! make<cr>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<right>", ":vertical resize +2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<up>", ":resize -2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "S", "<Plug>(easymotion-overwin-line)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "ga", "<plug>(EasyAlign)", { noremap = false })
vim.api.nvim_set_keymap("n", "s", "<Plug>(easymotion-overwin-f2)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<m-b>", [[<c-\><c-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<down>", [[:m '>+1<cr>gv=cv]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>s", ":sort<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<up>", [[:m '>-2<cr>gv=cv]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "ga", "<plug>(EasyAlign)", { noremap = false })

vim.api.nvim_set_keymap(
    "n",
    "<leader>bo",
    [[:!source ~/.config/zsh/custom_func.zsh && blackout<cr><cr><C-l>]],
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>cbin",
    [[:!source ~/.config/zsh/custom_func.zsh && change<cr><cr><C-l>]],
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>cbif",
    [[:!source ~/.config/zsh/custom_func.zsh && change_f<cr><cr><C-l>]],
    { noremap = true, silent = true }
)
-- vim.api.nvim_set_keymap('n', 'q:', [[<nop>]], {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', 'Q', [[<nop>]], {noremap = true, silent = true})

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                   « AutoCommands »                          │
-- ┼─────────────────────────────────────────────────────────────────┼

vim.cmd([[autocmd WinEnter,BufEnter,FocusGained,InsertLeave,CursorHold * set cursorline nocursorcolumn]])
vim.cmd([[autocmd BufLeave,FocusLost,InsertEnter,CursorMoved * set nocursorline nocursorcolumn]])
vim.cmd([[autocmd ColorScheme * hi Normal guibg=none]])
vim.cmd([[autocmd ColorScheme * hi NormalNC guibg=none]])
vim.cmd([[autocmd ColorScheme * hi NormalSB guibg=none]])
vim.cmd([[autocmd ColorScheme * hi NormalFloat guibg=none]])

vim.cmd([[autocmd ColorScheme * hi SignColumn guibg=none]])
vim.cmd([[autocmd ColorScheme * hi EndOfBuffer guifg=#222222]])
vim.cmd([[autocmd ColorScheme * hi VertSplit guibg=none]])
vim.cmd([[autocmd ColorScheme * hi GitSignsAdd guifg=lightblue]]) -- 9999ff
vim.cmd([[autocmd ColorScheme * hi CmpDocumentation guibg=none]])
vim.cmd([[autocmd ColorScheme * hi CmpDocumentationBorder guibg=none]])
vim.cmd([[autocmd ColorScheme * hi EasyMotionTarget  guifg=yellow]])
vim.cmd([[autocmd ColorScheme * hi GitSignsAdd      guibg=none  guifg=lightblue]])
vim.cmd([[autocmd ColorScheme * hi GitSignsAddNr    guibg=none  guifg=lightblue]])
vim.cmd([[autocmd ColorScheme * hi GitSignsAddLn    guibg=none  guifg=lightblue]])
vim.cmd([[autocmd ColorScheme * hi GitSignsChange   guibg=none  guifg=lightgreen]])
vim.cmd([[autocmd ColorScheme * hi GitSignsChangeNr guibg=none  guifg=lightgreen]])
vim.cmd([[autocmd ColorScheme * hi GitSignsChangeLn guibg=none  guifg=lightgreen]])
vim.cmd([[autocmd ColorScheme * hi LineNr guibg=none  guifg=#5b6282]])
vim.cmd([[autocmd ColorScheme * hi NvimTreeNormal guibg=none]])
vim.cmd([[autocmd ColorScheme * hi GitSignsDelete   guibg=none  guifg=red]])
vim.cmd([[autocmd ColorScheme * hi GitSignsDeleteNr guibg=none  guifg=red]])
vim.cmd([[autocmd ColorScheme * hi GitSignsDeleteLn guibg=none  guifg=red]])
vim.cmd([[autocmd ColorScheme * hi Substitute guibg=#ffe37e guifg=#192330]])
vim.cmd([[autocmd ColorScheme * hi Search guibg=#ffe37e guifg=#192330]])

vim.cmd([[autocmd TermOpen * setlocal nonumber norelativenumber]])

-- vim.cmd [[autocmd Filetype * lua require'lsp-status'.update_current_function()]]

vim.cmd([[augroup LuaHighLight]])
vim.cmd([[ au! ]])
vim.cmd([[ au TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank()]])
vim.cmd([[augroup END]])
-- cursorline

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{             « Folding Configurations »                      │
-- ┼─────────────────────────────────────────────────────────────────┼

vim.cmd([[
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
            let l:endofline = 86 " (&textwidth>0 ? &textwidth : 80 + 6)
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
]])

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- vim:set foldmethod=marker:
