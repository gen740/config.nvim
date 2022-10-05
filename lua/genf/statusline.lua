local gitbranch = require('genf.gitbranch')

-- Define Colors
vim.api.nvim_create_namespace('StatusLeftContent')
vim.api.nvim_create_namespace('StatusLeftSeparatorLeft')
vim.api.nvim_create_namespace('StatusLeftSeparatorRight')
vim.api.nvim_create_namespace('StatusCenterContent')
vim.api.nvim_create_namespace('StatusCenterLSPStatus')

local function set_statusline_hl()
  vim.api.nvim_set_hl(0, 'StatusLeftContent', { fg = '#222222', bg = '#719cd6' })
  vim.api.nvim_set_hl(0, 'StatusLeftSeparatorLeft', { fg = '#719cd6', bg = nil })
  vim.api.nvim_set_hl(0, 'StatusLeftSeparatorRight', { fg = '#719cd6', bg = nil })
  vim.api.nvim_set_hl(0, 'StatusCenterContent', { fg = '#71839b', bg = nil })
  vim.api.nvim_set_hl(0, 'StatusCenterLSPStatus', { fg = '#41536b', bg = nil })
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('StatusLineHL', { clear = true })
autocmd({ 'ColorScheme' }, {
  group = 'StatusLineHL',
  callback = set_statusline_hl,
})

-- statusline Components
function Word_count()
  return ' ' .. vim.fn.wordcount()['chars']
end

function Get_git_branch()
  local branch = gitbranch.get_branch(vim.api.nvim_get_current_buf())
  if branch == '' then
    return ''
  end
  return '  ' .. branch -- .. ' '
end

-- statusline
local str = ''

-- -- str = str .. '%#StatusLeftSeparatorLeft#%*'
-- -- str = str .. '%#StatusLeftContent# %t %M %*'
-- -- str = str .. '%#StatusLeftSeparatorRight#%*'
-- str = str .. [[%#StatusCenterContent#]]
-- str = str .. '  %M '
-- str = str .. [[%{luaeval('Get_git_branch()')}]]
-- str = str .. [[%*]]
--
-- str = str .. [[%.50(%#StatusCenterLSPStatus# %{luaeval('require("lsp-status").status()')}%*%)]]
-- -- str = str .. [[%=%#StatusCenterContent#%t%*]]
-- str = str .. [[%=%#StatusCenterContent#%f%*]]
--
-- str = str .. [[%=%#StatusCenterContent#]]
-- -- str = str .. [[%{luaeval('Word_count()')}]]
-- -- str = str .. [[  %l:%L ]]
-- str = str .. [[%*]]

str = str .. [[%=%=]]

vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#ffffff', bg = nil })

vim.opt.statusline = str
