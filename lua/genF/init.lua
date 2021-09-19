-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « Vim Options »                                     │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- vim.g.python3_host_prog='~/.pyenv/versions/neovim-3/bin/python'
-- vim.g.python_host_prog='~/.pyenv/versions/neovim-2/bin/python'

vim.g.enc = 'utf-8'
vim.g.fileencoding = 'utf-8'
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.clipboard = 'unnamed'
vim.opt.colorcolumn = '100'
vim.opt.concealcursor= 'c'
vim.opt.conceallevel = 1
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.foldcolumn = '0'
vim.opt.foldenable = true
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 999
vim.opt.foldmethod = 'expr'
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = [[tab:»-,conceal:◇,trail:▒,extends:»,precedes:«,nbsp:%]] -- ,eol:↲│
vim.opt.modeline = true
vim.opt.mouse:append('a')
vim.opt.number = true
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shada = [['1000,f1,<500,:500,@500,/500]]
vim.opt.shiftwidth = 4
vim.opt.shortmess = 'acostTWI'
vim.opt.showcmd = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 300
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.wrap = false

-- }}}
-- vim:set foldmethod=marker:
