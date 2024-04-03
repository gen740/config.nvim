local vim_options = {
  backspace = [[indent,eol,start]],
  breakindent = true,
  clipboard = 'unnamed',
  cmdheight = 0,
  equalalways = false,
  fillchars = { eob = ' ', stl = '▓', stlnc = '▓', vert = '▓', diff = ' ', fold = '┈' },
  foldenable = true,
  foldmethod = 'expr',
  foldlevel = 99,
  foldtext = 'v:lua.genf.foldingtxt()',
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
  shada = [['1000,f1,<500,:500,@500,/500]],
  shortmess = 'acOsTWFI',
  showmode = false,
  showtabline = 1,
  statusline = [[%{''}]],
  signcolumn = 'yes',
  smartcase = true,
  splitbelow = true,
  splitright = true,
  tabline = '%!v:lua.genf.tabline()',
  termguicolors = true,
  undodir = os.getenv('HOME') .. '/.vim/undo',
  undolevels = 10000,
  undoreload = 10000,
  updatetime = 250,
  viewoptions = 'folds,cursor',
  whichwrap = 'b,s,<,>,[,]',
  winbar = [[%!v:lua.genf.winbar()]],
  wrap = false,
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

vim.cmd([[colo tokyonight-night]])
