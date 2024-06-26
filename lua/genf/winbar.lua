local M = {}

local search_count = function()
  local status, stats = pcall(vim.fn.searchcount, { maxcount = 999 })
  if status == 0 then
    return ''
  end
  if
    stats == nil
    or stats.total == nil
    or stats.maxcount == nil
    or stats.current == nil
    or (
      (stats.current == 0 or stats.exact_match ~= 1)
      and not (vim.fn.getcmdtype() == '/' or vim.fn.getcmdtype() == '?')
    )
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
      return string.format(
        ' %s%s [>%d/>%d]',
        search_char,
        vim.fn.getreg('/'),
        stats.current,
        stats.total
      )
    elseif stats.total > stats.maxcount then
      return string.format(
        ' %s%s [%d/>%d]',
        search_char,
        vim.fn.getreg('/'),
        stats.current,
        stats.total
      )
    end
  end
  return string.format(' %s%s [%d/%d]', search_char, vim.fn.getreg('/'), stats.current, stats.total)
end

local git_branch = function()
  local handle = io.popen('zsh_status git_branch_nvim 2> /dev/null', 'r')
  if handle ~= nil then
    local branch = handle:read()
    handle:close()
    return branch or ''
  end
  return ''
end

---@class ProgressValue
---@field percentage? uinteger
---@field message? string
---@field title? string

---@class LspProgress
---@field in_progress boolean
---@field value? ProgressValue
local current_progress = {
  in_progress = false,
  value = {
    percentage = 0,
    message = '',
    title = '',
  },
}

---@param val LspProgress
M.set_current_progress = function(val)
  current_progress = vim.tbl_extend('force', current_progress, val)
end

local format_progress = function()
  local width = 20
  local mes = ''

  if current_progress.value.message == nil or current_progress.value.percentage == nil then
    return ''
  end

  for i = 1, width do
    if (100 * i / width) < current_progress.value.percentage then
      mes = mes .. '%#WinBarLspProgressDone#━%*'
    else
      mes = mes .. '%#WinBarLspProgress#─%*'
    end
  end

  return string.format('%s[%s]', current_progress.value.message, mes)
end

M.lsp_status = function()
  if current_progress.in_progress then
    return format_progress()
  end

  local ERROR = vim.diagnostic.severity.ERROR
  local WARN = vim.diagnostic.severity.WARN
  local INFO = vim.diagnostic.severity.INFO
  local HINT = vim.diagnostic.severity.HINT

  local diag = vim.diagnostic.get(0, {
    severity = {
      ERROR,
      WARN,
      INFO,
      HINT,
    },
  })
  local diag_nr = {
    [ERROR] = 0,
    [WARN] = 0,
    [INFO] = 0,
    [HINT] = 0,
  }

  for _, v in ipairs(diag) do
    if diag_nr[v.severity] ~= nil then
      diag_nr[v.severity] = diag_nr[v.severity] + 1
    end
  end

  local msg = ''
  local highlight_wrap = function(hl, str)
    return '%#' .. hl .. '#' .. str .. '%*'
  end
  if diag_nr[ERROR] ~= 0 then
    msg = highlight_wrap('WinBarLspError', msg .. ' ' .. diag_nr[ERROR])
  end
  msg = msg .. ' '
  if diag_nr[WARN] ~= 0 then
    msg = highlight_wrap('WinBarLspWarn', msg .. ' ' .. diag_nr[WARN])
  end
  msg = msg .. ' '
  if diag_nr[INFO] ~= 0 then
    msg = highlight_wrap('WinBarLspInfo', msg .. ' ' .. diag_nr[INFO])
  end
  msg = msg .. ' '
  if diag_nr[HINT] ~= 0 then
    msg = highlight_wrap('WinBarLspHint', msg .. ' ' .. diag_nr[HINT])
  end

  return msg
end

local macro = function()
  local reg = vim.fn.reg_recording() or ''
  if reg == '' then
    return ''
  end
  return ' Recorging @' .. reg
end

M.expr = function()
  return string.format(
    [[  %%#WinBarFileName#%%f%%* %%M%s%s]]
      .. [[%%= ]]
      .. [[%%{%%luaeval("require('genf.winbar').lsp_status()")%%} %s]],
    search_count(),
    macro(),
    git_branch()
  )
end

return M
