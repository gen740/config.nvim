-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                  « Vim Options »                            │
-- ┼─────────────────────────────────────────────────────────────────┼
local function dir_exists(path)
    if type(path) ~= 'string' then
        error('input error')
        return false
    end
    local response = os.execute('cd ' .. path .. ' 2> /dev/null')
    if response == nil then
        return false
    end
    return response
end

if dir_exists("~/.pyenv/versions/neovim-3/bin") then
    vim.g.python3_host_prog = "~/.pyenv/versions/neovim-3/bin/python3"
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
vim.api.nvim_set_keymap("n", "<c-n>", "<cmd>BufferLineCycleNext<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<c-p>", "<cmd>BufferLineCyclePrev<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<c-q>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<m-j>", "<cmd>resize +2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-h>", "<cmd>vertical resize -2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-l>", "<cmd>vertical resize +2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-k>", "<cmd>resize -2<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-n>", "<cmd>cn<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-p>", "<cmd>co<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<m-w>", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>copen<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tcb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>Telescope git_branches<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>Telescope file_browser<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":Telescope", { noremap = false, silent = false })

vim.api.nvim_set_keymap("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bn", "<cmd>BufferLineMoveNext<cr>", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bp", "<cmd>BufferLineMovePrev<cr>", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "<leader>ut", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "S", "<Plug>(easymotion-overwin-line)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", "<Plug>(easymotion-overwin-f2)", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "f", "<Plug>Sneak_s", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "F", "<Plug>Sneak_S", { noremap = false, silent = true })
vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<cr>", { noremap = false, silent = true })

vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true, silent = true })

vim.api.nvim_set_keymap("t", "<m-b>", [[<c-\><c-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>s", ":sort<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'q:', [[<nop>]], { noremap = true, silent = true })

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
    autocmd ColorScheme * hi DiagnosticUnderlineError guibg=#303230 gui=none
    autocmd ColorScheme * hi DiagnosticUnderlineWarn guibg=#303230 gui=none
    autocmd BufRead,BufNewFile * hi Folded guifg=#928374 guibg=none gui=undercurl
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
]])

vim.cmd([[
augroup LuaHighLight
    au!
    au TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank()
augroup END
]])

vim.cmd([[
    function! s:load_plugins()
    endfunction
    autocmd User load_plugins call s:load_plugins()
    function! s:load_plug(timer)
        doautocmd User load_plugins
    endfunction
    call timer_start(300, function("s:load_plug"))
]])

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼

vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu   = 1
-- vim.g.did_indent_on             = 1
vim.g.do_filetype_lua           = 1
vim.g.did_load_filetypes        = 0
-- vim.g.did_load_ftplugin         = 1
vim.g.loaded_2html_plugin       = 1
vim.g.loaded_gzip               = 1
vim.g.loaded_man                = 1
vim.g.loaded_matchit            = 1
vim.g.loaded_matchparen         = 1
vim.g.loaded_netrwPlugin        = 1
vim.g.loaded_remote_plugins     = 1
vim.g.loaded_shada_plugin       = 1
vim.g.loaded_spellfile_plugin   = 1
vim.g.loaded_tarPlugin          = 1
vim.g.loaded_tutor_mode_plugin  = 1
vim.g.loaded_zipPlugin          = 1
vim.g.skip_loading_mswin        = 1

-- vim:set foldmethod=marker foldlevel=0:
