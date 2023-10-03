local vim_options = {
  backspace = [[indent,eol,start]],
  breakindent = true,
  clipboard = 'unnamed',
  colorcolumn = '80',
  expandtab = true,
  fillchars = {
    eob = ' ',
    stl = '▓',
    stlnc = '▓',
    vert = '▓',
    diff = ' ',
  },
  foldenable = true,
  foldexpr = 'v:lua.vim.treesitter.foldexpr()',
  -- foldtext = 'v:lua.vim.treesitter.foldtext()',
  foldlevel = 99,
  foldmethod = 'expr',
  guicursor = '',
  ignorecase = true,
  inccommand = 'nosplit',
  incsearch = true,
  list = true,
  listchars = [[tab:»─,trail:─,extends:»,precedes:«,nbsp:%]], -- ,eol:↲│,conceal:◇
  modeline = true,
  mouse = '',
  mousemodel = '',
  number = true,
  pumheight = 10,
  relativenumber = true,
  ruler = false,
  scrolloff = 8,
  shada = [['1000,f1,<500,:500,@500,/500]],
  shiftwidth = 2,
  shortmess = 'acOsTWFI',
  showmode = false,
  showtabline = 0,
  signcolumn = 'yes',
  smartcase = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  undodir = os.getenv('HOME') .. '/.vim/undo',
  undofile = true,
  undolevels = 10000,
  undoreload = 10000,
  updatetime = 250,
  viewoptions = 'folds,cursor',
  whichwrap = 'b,s,<,>,[,]',
  wrap = false,
}

---@diagnostic disable: inject-field
vim.g.netrw_silent = true
vim.g.vimsyn_embed = 'lPr'
vim.g.loaded_perl_provider = 0
vim.g.mapleader = [[ ]]
---@diagnostic enable: inject-field

for name, val in pairs(vim_options) do
  vim.opt[name] = val
end

-- quickfix text function
_G.QfTextFunc = function(info)
  local l = {}
  if info.quickfix == 1 then
    local qflist = vim.fn.getqflist({ id = info.id, items = 1 }).items
    for idx, val in ipairs(qflist) do
      if not (val.valid == 1) then
        l[#l + 1] = '┃ ' .. val.text:gsub('|', '┃')
      else
        if val.bufnr == 0 and val.lnum == 0 then
          l[#l + 1] = ' כֿ  ⇒ ' .. val.text
        elseif val.type == 'e' then
          l[#l + 1] = string.format(
            '  %s|%s| ⇒ %s',
            vim.fn.bufname(val.bufnr),
            val.lnum,
            val.text
          )
        elseif val.type == 'w' then
          l[#l + 1] = string.format(
            '  %s|%s| ⇒ %s',
            vim.fn.bufname(val.bufnr),
            val.lnum,
            val.text
          )
        else
          l[#l + 1] = string.format(
            ' כֿ %s|%s| ⇒ %s',
            vim.fn.bufname(val.bufnr),
            val.lnum,
            val.text
          )
        end
      end
    end
    if vim.fn.len(l) == 0 then
      return {}
    end
    return l
  else
    local loclist = vim.fn.getloclist(0, { all = 0 }).items
    for idx, val in ipairs(loclist) do
      if not (val.valid == 1) then
        l[#l + 1] = '┃ ' .. val.text:gsub('|', '┃')
      else
        if val.bufnr == 0 and val.lnum == 0 then
          l[#l + 1] = ' כֿ ' .. ' ⇒ ' .. val.text
        else
          l[#l + 1] = string.format(
            '  %s|%s| ⇒ %s',
            vim.fn.bufname(val.bufnr),
            val.lnum,
            val.text
          )
        end
      end
    end
    if vim.fn.len(l) == 0 then
      return {}
    end
    return l
  end
end
vim.opt.qftf = 'v:lua.QfTextFunc'
