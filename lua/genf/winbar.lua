local M = {}

local file_icon = function()
  return [[%{luaeval("require('nvim-web-devicons').get_icon_by_filetype(vim.api.nvim_buf_get_option(0, 'filetype'))")}]]
end

local in_search = function()
  return vim.fn.getcmdtype() == '/' or vim.fn.getcmdtype() == '?'
end

local search_count = function()
  local stats = vim.fn.searchcount { maxcount = 999 }
  if
    stats == nil
    or stats.total == nil
    or stats.maxcount == nil
    or stats.current == nil
    or ((stats.current == 0 or stats.exact_match ~= 1) and not in_search())
  then
    return ''
  end

  local search_char = '?'
  if vim.v.searchforward == 1 then
    search_char = '/'
  end

  if stats.incomplete == 1 then
    return ''
  elseif stats.incomplete == 2 then -- maxcount exceed
    if stats.total > stats.maxcount and stats.current > stats.maxcount then
      return string.format('%s%s [>%d/>%d]', search_char, vim.fn.getreg('/'), stats.current, stats.total)
    elseif stats.total > stats.maxcount then
      return string.format('%s%s [%d/>%d]', search_char, vim.fn.getreg('/'), stats.current, stats.total)
    end
  end
  return string.format('%s%s [%d/%d]', search_char, vim.fn.getreg('/'), stats.current, stats.total)
end

local gitbranch = require('genf.gitbranch')

local git_branch = function()
  local branch = gitbranch.get_branch()
  if branch == '' then
    return ''
  end
  return ' ' .. branch
end

local lsp_status = function()
  if not pcall(require, 'lsp-status') then
    return ''
  end
  return (require('lsp-status').status_progress().spinner or '') .. ' ' .. require('lsp-status').status()
end

M.expr = function()
  return string.format(
    ' %s %%#WinBarFileName#%%f%%* %%M %s%%=%s %s',
    file_icon(),
    search_count(),
    lsp_status(),
    git_branch()
  )
end

return M
