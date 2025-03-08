vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'

local vim_options = {
  clipboard = 'unnamed',
  fillchars = { eob = ' ', stl = '▓', stlnc = '▓', vert = '▓', diff = ' ', fold = '┈' },
  foldlevel = 99,
  foldmethod = 'expr',
  ignorecase = true,
  list = true,
  listchars = [[tab:»─,trail:␣,extends:»,precedes:«,nbsp:%]],
  signcolumn = 'yes',
  number = true,
  pumheight = 25,
  relativenumber = true,
  scrolloff = 8,
  smartcase = true,
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
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

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end,
})

vim.cmd('colorscheme github_dark_colorblind')

vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#30363d', fg = '#0d1117' })
