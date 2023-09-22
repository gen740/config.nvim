local vim_options = {
  backspace = [[indent,eol,start]],
  breakindent = true,
  clipboard = 'unnamed',
  colorcolumn = '80',
  expandtab = true,
  fillchars = {
    eob = ' ',
    stl = '▓',
    stlnc = '▓',
    vert = '▓',
    diff = ' ',
  },
  foldenable = true,
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldlevel = 99,
  foldmethod = 'expr',
  guicursor = '',
  ignorecase = true,
  inccommand = 'nosplit',
  incsearch = true,
  list = true,
  listchars = [[tab:»─,trail:─,extends:»,precedes:«,nbsp:%]], -- ,eol:↲│,conceal:◇
  modeline = true,
  mouse = '',
  mousemodel = '',
  number = true,
  pumheight = 10,
  relativenumber = true,
  ruler = false,
  scrolloff = 8,
  shada = [['1000,f1,<500,:500,@500,/500]],
  shiftwidth = 2,
  shortmess = 'acOsTWFI',
  showmode = false,
  showtabline = 0,
  signcolumn = 'yes',
  smartcase = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  undodir = os.getenv('HOME') .. '/.vim/undo',
  undofile = true,
  undolevels = 10000,
  undoreload = 10000,
  updatetime = 250,
  viewoptions = 'folds,cursor',
  whichwrap = 'b,s,<,>,[,]',
  wrap = false,
}

vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'
vim.g.loaded_perl_provider = 0
vim.g.mapleader = [[ ]]

for name, val in pairs(vim_options) do
  vim.opt[name] = val
end

-- quickfix text function
require('genf.utils')
vim.opt.qftf = 'v:lua.QfTextFunc'
