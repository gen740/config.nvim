-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                  « Vim Options »                            │
-- ┼─────────────────────────────────────────────────────────────────┼
local handle = io.popen("which pyenv")
local result = handle:read("*a")
handle:close()

if result ~= "" then
    vim.g.python3_host_prog = "~/.pyenv/versions/neovim-3/bin/python"
end

vim.opt.clipboard = "unnamed"
vim.opt.colorcolumn = "100"
vim.opt.expandtab = true
vim.opt.foldenable = true
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.gdefault = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = [[tab:»-,trail:▒,extends:»,precedes:«,nbsp:%]] -- ,eol:↲│,conceal:◇

if vim.fn.has("nvim-0.7") then
    vim.opt.laststatus = 3
end

vim.opt.modeline = true
vim.opt.mouse:append("a")
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.runtimepath:append("~/.config/nvim/custom_runtime")
vim.opt.scrolloff = 8
vim.opt.shada = [['1000,f1,<500,:500,@500,/500]]
vim.opt.shortmess = "acostTWI"
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.guicursor = ""

vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.softtabstop = 2
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo"
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000
vim.opt.updatetime = 1500
vim.opt.whichwrap = "b,s,<,>,[,]"
vim.opt.wrap = false
-- vim.opt.showmatch = true

vim.g.netrw_silent = true
vim.g.vimsyn_embed = "lPr"

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                   « Key mappings »                          │
-- ┼─────────────────────────────────────────────────────────────────┼

vim.cmd([[let mapleader = "\<Space>"]])

-- stylua: ignore start
vim.api.nvim_set_keymap("n", "<c-e>", "3<c-e>", { noremap = true })
vim.api.nvim_set_keymap("n", "<c-n>", "<cmd>BufferLineCycleNext<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<c-p>", "<cmd>BufferLineCyclePrev<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<c-q>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-j>", "<cmd>resize +2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-h>", "<cmd>vertical resize -2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-l>", "<cmd>vertical resize +2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-k>", "<cmd>resize -2<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>bl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mc", "<cmd>BufferLinePickClose<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mm", "<cmd>BufferLinePick<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mn", "<cmd>BufferLineMoveNext<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mp", "<cmd>BufferLineMovePrev<cr>", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>copen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>vq", "<cmd>vertical copen<cr>:vertical resize 80<cr>:wincmd h<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cn", "<cmd>cn<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cp", "<cmd>co<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ss", "<cmd>silent !open https://google.com -a /Applications/Safari.app<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>TagbarToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>Telescope file_browser<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":Telescope", { noremap = false, silent = false })

vim.api.nvim_set_keymap("n", "<leader>ut", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-c>", "<cmd>vertical copen<cr><cmd>vertical resize 80<cr><cmd>wincmd h<cr><cmd>Neomake! build<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-r>", "<cmd>vertical copen<cr><cmd>vertical resize 80<cr><cmd>wincmd h<cr><cmd>Neomake! make<cr>", { noremap = true, silent = true })

-- KEYMAPS
vim.api.nvim_set_keymap("n", "S", "<Plug>(easymotion-overwin-line)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", "<Plug>(easymotion-overwin-f2)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>j", "<Plug>(easymotion-j)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>k", "<Plug>(easymotion-k)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>h", "<Plug>(easymotion-linebackward)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", "<Plug>(easymotion-lineforward)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ww", "<Plug>(easymotion-w)", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<cr>", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true, silent = true })

vim.api.nvim_set_keymap("t", "<m-b>", [[<c-\><c-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>s", ":sort<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "ga", "<plug>(EasyAlign)", { noremap = false })
vim.api.nvim_set_keymap("n", "ga", "<plug>(EasyAlign)", { noremap = false })

vim.api.nvim_set_keymap('n', 'q:', [[<nop>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'Q', [[<nop>]], { noremap = true, silent = true })
-- stylua: ignore end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                   « AutoCommands »                          │
-- ┼─────────────────────────────────────────────────────────────────┼

vim.cmd([[
augroup CustomColorScheme
    au!
    autocmd WinEnter,BufEnter,BufWinEnter,FocusGained,InsertLeave * set cursorline nocursorcolumn
    autocmd BufLeave,FocusLost,BufWinLeave,InsertEnter * set nocursorline nocursorcolumn
    autocmd ColorScheme * hi Normal guibg=none
    autocmd ColorScheme * hi CursorLine guibg=#282828
    autocmd ColorScheme * hi NormalNC guibg=none
    autocmd ColorScheme * hi NormalSB guibg=none
    " autocmd ColorScheme * hi NormalFloat guibg=none
    autocmd ColorScheme * hi SignColumn guibg=none
    autocmd ColorScheme * hi EndOfBuffer guifg=#222222
    autocmd ColorScheme * hi VertSplit guibg=none
    autocmd ColorScheme * hi GitSignsAdd guifg=lightblue " 9999ff
    " autocmd ColorScheme * hi CmpDocumentation guibg=none
    " autocmd ColorScheme * hi CmpDocumentationBorder guibg=none
    autocmd ColorScheme * hi EasyMotionTarget  guifg=yellow
    autocmd ColorScheme * hi GitSignsAdd      guibg=none  guifg=lightblue
    autocmd ColorScheme * hi GitSignsAddNr    guibg=none  guifg=lightblue
    autocmd ColorScheme * hi GitSignsAddLn    guibg=none  guifg=lightblue
    autocmd ColorScheme * hi GitSignsChange   guibg=none  guifg=lightgreen
    autocmd ColorScheme * hi GitSignsChangeNr guibg=none  guifg=lightgreen
    autocmd ColorScheme * hi GitSignsChangeLn guibg=none  guifg=lightgreen
    autocmd ColorScheme * hi LineNr guibg=none  guifg=#5b6282
    autocmd ColorScheme * hi NvimTreeNormal guibg=none
    autocmd ColorScheme * hi GitSignsDelete   guibg=none  guifg=red
    autocmd ColorScheme * hi GitSignsDeleteNr guibg=none  guifg=red
    autocmd ColorScheme * hi GitSignsDeleteLn guibg=none  guifg=red
    autocmd ColorScheme * hi Substitute guibg=#ffe37e guifg=#192330
    autocmd ColorScheme * hi Search guibg=#333333 gui=bold guifg=#ffe37e
    autocmd BufRead,BufNewFile * hi Folded guifg=#928374 guibg=none gui=undercurl 
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

augroup LuaHighLight
    au!
    au TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank()
augroup END
]])

-- cursorline

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼

-- vim:set foldmethod=marker foldlevel=0:
