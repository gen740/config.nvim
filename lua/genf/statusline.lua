local gitbranch = require('genf.gitbranch')

vim.api.nvim_create_namespace('StatusLeftContent')
vim.api.nvim_create_namespace('StatusLeftSeparatorLeft')
vim.api.nvim_create_namespace('StatusLeftSeparatorRight')
vim.api.nvim_create_namespace('StatusCenterContent')
vim.api.nvim_create_namespace('StatusCenterLSPStatus')
vim.api.nvim_set_hl(0, 'StatusLeftContent', { fg = '#222222', bg = '#719cd6' })
vim.api.nvim_set_hl(0, 'StatusLeftSeparatorLeft', { fg = '#719cd6', bg = nil })
vim.api.nvim_set_hl(0, 'StatusLeftSeparatorRight', { fg = '#719cd6', bg = nil })
vim.api.nvim_set_hl(0, 'StatusCenterContent', { fg = '#71839b', bg = nil })
vim.api.nvim_set_hl(0, 'StatusCenterLSPStatus', { fg = '#41536b', bg = nil })

-- statusline

function Word_count()
    return ' ' .. vim.fn.wordcount()['chars']
end

function Get_git_branch()
    local branch = gitbranch.get_branch(vim.api.nvim_get_current_buf())
    if branch == '' then
        return ''
    end
    return '  ' .. branch .. ' '
end

local str = ''

str = str .. '%#StatusLeftSeparatorLeft#%*'
str = str .. '%#StatusLeftContent# %t %M %*'
str = str .. '%#StatusLeftSeparatorRight#%*'
str = str .. [[%#StatusCenterContent#%{luaeval('Get_git_branch()')}%*]]
str = str .. [[%.50(%#StatusCenterLSPStatus# %{luaeval('require("lsp-status").status()')}%*%)]]
str = str .. [[%=%#StatusCenterContent#%{luaeval('Word_count()')}   %l:%L%* ]]

vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#ffffff', bg = nil })

vim.opt.statusline = str
