--┼───────────────────────────────────────────────────────────────────────────────────────┼
--│ {{{                              « Vim Options »                                      │
--┼───────────────────────────────────────────────────────────────────────────────────────┼
vim.cmd 'packadd! matchit'
vim.cmd 'colo gruvbox'
vim.cmd [[set fillchars+=vert:\ ]]
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.backupext = '.bak'
vim.opt.clipboard = 'unnamed'
vim.opt.colorcolumn = '100'
vim.opt.completeopt:remove('preview')
vim.opt.conceallevel = 1
vim.opt.cursorline = true
vim.opt.display = 'lastline'
vim.opt.exrc = true
vim.opt.foldenable = true
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 999
vim.opt.foldmethod = 'expr'
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.iskeyword:remove(':')
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = [[tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%]]
vim.opt.matchtime = 5
vim.opt.modeline = true
vim.opt.number = true
vim.opt.path:append([[**]])
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.runtimepath:append('~/.vim/custom_runtime')
vim.opt.scrolloff = 8
vim.opt.shada = [['1000,f1,<500,:500,@500,/500]]
vim.opt.shortmess:append('c')
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tags = '.tags;~'
vim.opt.termguicolors = true
vim.opt.undodir = '~/.vim/undo'
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 300
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.wildmenu = true
vim.opt.wildmode:append([[full]])
vim.opt.wildmode:append([[longest]])
vim.opt.writebackup = false
-- }}}
