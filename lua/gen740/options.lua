vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'

local vim_options = {
  clipboard = 'unnamed',
  fillchars = { eob = ' ', stl = '▓', stlnc = '▓', vert = '▓', diff = ' ', fold = '┈' },
  foldlevel = 99,
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

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
  end,
})

vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#30363d', fg = '#0d1117' })
vim.cmd('colorscheme github_dark_colorblind')
