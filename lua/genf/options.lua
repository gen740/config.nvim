_G.QfTextFunc = require('genf.qftextfunc').expr

local vim_options = {
  backspace = [[indent,eol,start]],
  breakindent = true,
  clipboard = 'unnamed',
  cmdheight = 0,
  colorcolumn = '80',
  expandtab = true,
  equalalways = false,
  fillchars = {
    eob = ' ',
    stl = '▓',
    stlnc = '▓',
    vert = '▓',
    diff = ' ',
    fold = '┈',
  },
  foldenable = true,
  foldexpr = 'v:lua.vim.treesitter.foldexpr()',
  foldlevel = 99,
  foldmethod = 'expr',
  foldtext = 'v:lua.require("genf.foldingtxt").expr()',
  ignorecase = true,
  inccommand = 'nosplit',
  incsearch = true,
  laststatus = 0,
  list = true,
  listchars = [[tab:»─,trail:─,extends:»,precedes:«,nbsp:%]], -- ,eol:↲│,conceal:◇
  modeline = true,
  mouse = '',
  mousemodel = '',
  number = true,
  pumheight = 10,
  qftf = 'v:lua.QfTextFunc',
  relativenumber = true,
  ruler = false,
  scrolloff = 8,
  shada = [['1000,f1,<500,:500,@500,/500]],
  shiftwidth = 2,
  shortmess = 'acOsTWFI',
  showmode = false,
  showtabline = 1,
  statusline = [[%{''}]],
  signcolumn = 'yes',
  smartcase = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  tabline = '%!v:lua.require("genf.tabline").expr()',
  termguicolors = true,
  undodir = os.getenv('HOME') .. '/.vim/undo',
  undofile = true,
  undolevels = 10000,
  undoreload = 10000,
  updatetime = 250,
  viewoptions = 'folds,cursor',
  whichwrap = 'b,s,<,>,[,]',
  winbar = [[%!v:lua.require("genf.winbar").expr()]],
  wrap = false,
}

for name, val in pairs(vim_options) do
  vim.opt[name] = val
end

-- disable providers
vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
