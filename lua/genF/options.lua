if vim.fn.has('nvim-0.7') then
    vim.opt.laststatus = 3
    vim.opt.cmdheight = 1
end

local opt = vim.opt

opt.clipboard = 'unnamed'
opt.colorcolumn = '81'

opt.foldenable = true
opt.foldlevel = 99
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'

opt.gdefault = true
opt.hidden = true
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.incsearch = true
opt.breakindent = true

opt.list = true
-- ,eol:↲│,conceal:◇
opt.listchars = [[tab:»-,trail:█,extends:»,precedes:«,nbsp:%]]

opt.modeline = true
opt.mouse:append('a')
opt.number = true
opt.pumheight = 10
opt.relativenumber = true
opt.runtimepath:append('~/.config/nvim/custom_runtime')
opt.scrolloff = 8
opt.shada = [['1000,f1,<500,:500,@500,/500]]
opt.shortmess = 'acostTWI'
opt.showmode = false
opt.signcolumn = 'yes'
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = true
opt.termguicolors = true
opt.guicursor = ''
opt.backspace = [[indent,eol,start]]
opt.winbar = '%=%f%m%='

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

opt.showtabline = 0
opt.undodir = os.getenv('HOME') .. '/.vim/undo'
opt.undofile = true
opt.undolevels = 10000
opt.undoreload = 10000
opt.updatetime = 250
opt.whichwrap = 'b,s,<,>,[,]'
opt.wrap = false
opt.viewoptions = "folds,cursor"
-- vim.opt.showmatch = true

vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'
