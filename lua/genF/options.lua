if vim.fn.has("nvim-0.7") then
    vim.opt.laststatus = 3
end

vim.opt.clipboard = "unnamed"
vim.opt.colorcolumn = "100"

vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.gdefault = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true

vim.opt.list = true
vim.opt.listchars = [[tab:»-,trail:▒,extends:»,precedes:«,nbsp:%]] -- ,eol:↲│,conceal:◇

vim.opt.modeline = true
vim.opt.mouse:append("a")
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = true
vim.opt.runtimepath:append("~/.config/nvim/custom_runtime")
vim.opt.scrolloff = 8
vim.opt.shada = [['1000,f1,<500,:500,@500,/500]]
vim.opt.shortmess = "acostTWI"
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = true
vim.opt.termguicolors = true
vim.opt.guicursor = ""
vim.opt.backspace = [[indent,eol,start]]

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.showtabline = 2
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undo"
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000
vim.opt.updatetime = 250
vim.opt.whichwrap = "b,s,<,>,[,]"
vim.opt.wrap = false
-- vim.opt.showmatch = true

vim.g.netrw_silent = true
vim.g.vimsyn_embed = "lPr"
