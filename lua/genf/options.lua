local vim_options = {
    backspace = [[indent,eol,start]],

    breakindent = true,
    clipboard = 'unnamed',
    colorcolumn = '81',
    foldenable = true,
    foldexpr = 'nvim_treesitter#foldexpr()',
    foldlevel = 99,
    foldmethod = 'expr',
    -- gdefault = true,
    guicursor = '',
    -- hidden = true,
    ignorecase = true,
    inccommand = 'nosplit',
    incsearch = true,
    list = true,
    listchars = [[tab:»-,trail:█,extends:»,precedes:«,nbsp:%]], -- ,eol:↲│,conceal:◇
    modeline = true,
    number = true,
    pumheight = 10,
    relativenumber = true,
    scrolloff = 8,
    shada = [['1000,f1,<500,:500,@500,/500]],
    shortmess = 'acostTWI',
    showmode = false,
    signcolumn = 'yes',
    smartcase = true,
    splitbelow = true,
    splitright = true,
    swapfile = true,
    termguicolors = true,

    showtabline = 0,
    undodir = os.getenv('HOME') .. '/.vim/undo',
    undofile = true,
    undolevels = 10000,
    undoreload = 10000,
    updatetime = 250,
    whichwrap = 'b,s,<,>,[,]',
    wrap = false,
    viewoptions = "folds,cursor",
    -- vim.cmd([[set fillchars+=eob:\ ]])
    fillchars = [[eob: ]],

    mousemodel = "",
    mouse = "",

    expandtab = true,
    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
}

if vim.fn.has('nvim-0.7') then
    vim.opt.laststatus = 3
    vim.opt.cmdheight = 1
end

-- if vim.fn.has('nvim-0.8') then
--     vim.opt.winbar = '%=%f%m%='
-- end

vim.g.loaded_2html_plugin      = true
vim.g.loaded_logiPat           = true
vim.g.loaded_getscriptPlugin   = true
vim.g.loaded_gzip              = true
vim.g.loaded_gtags             = true
vim.g.loaded_gtags_cscope      = true
vim.g.loaded_man               = true
vim.g.loaded_matchit           = true
vim.g.loaded_matchparen        = true
vim.g.loaded_netrwFileHandlers = true
vim.g.loaded_netrwPlugin       = true
vim.g.loaded_netrwSettings     = true
vim.g.loaded_rrhelper          = true
vim.g.loaded_shada_plugin      = true
vim.g.loaded_spellfile_plugin  = true
vim.g.loaded_tarPlugin         = true
vim.g.loaded_tutor_mode_plugin = true
vim.g.loaded_vimballPlugin     = true
vim.g.loaded_zipPlugin         = true

vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'

for name, val in pairs(vim_options) do
    vim.opt[name] = val
end

-- quickfix text function
require("genf.utils")
vim.opt.qftf = "v:lua.QfTextFunc"
