vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'

_G.genf = {
  qftf = require('genf.qftextfunc').expr,
  tabline = require('genf.tabline').expr,
  winbar = require('genf.winbar').expr,
}

local vim_options = {
  backspace = [[indent,eol,start]],
  breakindent = true,
  clipboard = 'unnamed',
  cmdheight = 0,
  equalalways = false,
  fillchars = { eob = ' ', stl = '▓', stlnc = '▓', vert = '▓', diff = ' ', fold = '┈' },
  foldenable = true,
  foldlevel = 99,
  foldmethod = 'expr',
  grepprg = 'rg --vimgrep',
  ignorecase = true,
  inccommand = 'nosplit',
  incsearch = true,
  laststatus = 0,
  list = true,
  listchars = [[tab:»─,trail:␣,extends:»,precedes:«,nbsp:%]],
  modeline = true,
  mouse = '',
  mousemodel = '',
  number = true,
  pumheight = 10,
  qftf = 'v:lua.genf.qftf',
  relativenumber = true,
  ruler = false,
  scrolloff = 8,
  shiftwidth = 2,
  shortmess = 'acOsTWFI',
  showmode = false,
  showtabline = 1,
  signcolumn = 'yes',
  smartcase = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  statusline = [[%{''}]],
  tabline = '%!v:lua.genf.tabline()',
  tabstop = 2,
  termguicolors = true,
  undodir = os.getenv('HOME') .. '/.vim/undo',
  undolevels = 10000,
  undoreload = 10000,
  undofile = true,
  updatetime = 250,
  viewoptions = 'folds,cursor',
  whichwrap = 'b,s,<,>,[,]',
  winbar = [[%!v:lua.genf.winbar()]],
  wrap = false,
  expandtab = true,
}

for name, val in pairs(vim_options) do
  vim.opt[name] = val
end

vim.api.nvim_create_augroup('LazyFoldExpr', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead' }, {
  group = 'LazyFoldExpr',
  callback = function()
    if vim.fn.line('$') < 10000 then -- Larger than 10000 lines will be slow startup
      vim.opt_local.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
  end,
})

vim.cmd([[colo tokyonight-moon]])
