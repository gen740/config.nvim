if vim.fn.has('nvim-0.7') then
    vim.opt.laststatus = 3
    vim.opt.cmdheight = 1
end

local vim_options = {
    backspace = [[indent,eol,start]],

    breakindent = true,
    clipboard = 'unnamed',
    colorcolumn = '81',
    foldenable = true,
    foldexpr = 'nvim_treesitter#foldexpr()',
    foldlevel = 99,
    foldmethod = 'expr',
    gdefault = true,
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
    winbar = '%=%f%m%=',

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

vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'

for name, val in pairs(vim_options) do
    vim.opt[name] = val
end
