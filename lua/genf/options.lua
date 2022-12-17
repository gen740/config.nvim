local vim_options = {
  backspace = [[indent,eol,start]],
  breakindent = true,
  clipboard = 'unnamed',
  colorcolumn = '80',
  foldenable = true,
  foldexpr = 'nvim_treesitter#foldexpr()',
  foldlevel = 99,
  foldmethod = 'expr',
  -- guicursor = '',
  ignorecase = true,
  inccommand = 'nosplit',
  incsearch = true,
  list = true,
  listchars = [[tab:»─,trail:─,extends:»,precedes:«,nbsp:%]], -- ,eol:↲│,conceal:◇
  modeline = true,
  number = true,
  pumheight = 10,
  relativenumber = true,
  scrolloff = 8,
  shada = [['1000,f1,<500,:500,@500,/500]],
  shortmess = 'acOsTWFI',
  showmode = false,
  signcolumn = 'yes',
  smartcase = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,

  showtabline = 0,
  undodir = os.getenv('HOME') .. '/.vim/undo',
  undofile = true,
  undolevels = 10000,
  undoreload = 10000,
  updatetime = 250,
  whichwrap = 'b,s,<,>,[,]',
  wrap = false,
  viewoptions = 'folds,cursor',
  -- vim.cmd([[set fillchars+=eob:\ ]])
  fillchars = [[eob: ,stl: ,stlnc:─,diff: ]],

  mousemodel = '',
  mouse = '',

  expandtab = true,
  ruler = false,
  tabstop = 4,
  shiftwidth = 4,
  softtabstop = 4,
}

if vim.fn.has('nvim-0.8') then
  vim.opt.winbar =
    [[ %{luaeval('require("nvim-web-devicons").get_icon_by_filetype(vim.api.nvim_buf_get_option(0, "ft"))')} %#WinBarFileName#%f%* %M%=]]
  vim.opt.laststatus = 3
  vim.opt.cmdheight = 0
  vim.opt.formatoptions:append('M')
end

vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'

for name, val in pairs(vim_options) do
  vim.opt[name] = val
end

-- quickfix text function
require('genf.utils')
vim.opt.qftf = 'v:lua.QfTextFunc'
