local gitbranch = require('genf.gitbranch')

-- Define Colors
vim.api.nvim_create_namespace('StatusLeftContent')
vim.api.nvim_create_namespace('StatusLeftSeparatorLeft')
vim.api.nvim_create_namespace('StatusLeftSeparatorRight')
vim.api.nvim_create_namespace('StatusCenterContent')

local function set_statusline_hl()
  vim.api.nvim_set_hl(0, 'StatusLeftContent', { fg = '#222222', bg = '#719cd6' })
  vim.api.nvim_set_hl(0, 'StatusLeftSeparatorLeft', { fg = '#719cd6', bg = nil })
  vim.api.nvim_set_hl(0, 'StatusLeftSeparatorRight', { fg = '#719cd6', bg = nil })
  vim.api.nvim_set_hl(0, 'StatusCenterContent', { fg = '#71839b', bg = nil })
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('StatusLineHL', { clear = true })
autocmd({ 'ColorScheme' }, {
  group = 'StatusLineHL',
  callback = set_statusline_hl,
})

-- -- statusline Components
-- function Word_count()
--   return ' ' .. vim.fn.wordcount()['chars']
-- end
--
-- function Get_git_branch()
--   -- local branch = gitbranch.get_branch(vim.api.nvim_get_current_buf())
--   local branch = gitbranch.get_branch()
--   if branch == '' then
--     return ''
--   end
--   return '' .. ' ' .. branch .. ' '
-- end
--
-- -- statusline

-- str = str .. [[ %#StatusLineContent#%{luaeval('Get_git_branch()')}%l:%L%* %=%=]]

vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#668aab', bg = nil })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#81b29a', bg = nil })

local str = [[%{luaeval('(function()return""end)()')}]]
vim.opt.statusline = str
