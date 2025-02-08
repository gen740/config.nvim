vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'

_G.gen740 = {
  qftf = require('gen740.qftextfunc').expr,
  tabline = require('gen740.tabline').expr,
  winbar = require('gen740.winbar').expr,
}

local vim_options = {
  clipboard = 'unnamed',
  cmdheight = 0,
  fillchars = { eob = ' ', stl = '▓', stlnc = '▓', vert = '▓', diff = ' ', fold = '┈' },
  foldlevel = 99,
  foldmethod = 'expr',
  ignorecase = true,
  laststatus = 0,
  list = true,
  listchars = [[tab:»─,trail:␣,extends:»,precedes:«,nbsp:%]],
  signcolumn = 'yes',
  number = true,
  pumheight = 25,
  qftf = 'v:lua.gen740.qftf',
  relativenumber = true,
  scrolloff = 8,
  showtabline = 1,
  smartcase = true,
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
  tabline = '%!v:lua.gen740.tabline()',
  statusline = [[%{''}]],
  winbar = [[%!v:lua.gen740.winbar()]],
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

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

vim.cmd([[colo tokyonight-moon]])
