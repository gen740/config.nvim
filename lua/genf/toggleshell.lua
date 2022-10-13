local M = {}
local winsize = 15

local win_kind = {
  ToggleTerm = { name = 'terminal', display_name = 'Terminal', cmd = nil },
  ToggleIpython3 = { name = 'ipython', display_name = 'Ipython', cmd = 'ipython3' },
  ToggleJulia = { name = 'julia', display_name = 'Julia', cmd = 'julia' },
}

local close_if_exist = function()
  for idx, val in ipairs(vim.fn.getbufinfo()) do
    if vim.fn.get(vim.fn.split(val.name, '/'), 0, '') == 'term:' then
      for key, value in pairs(win_kind) do
        if (val.variables[key] == true) and val.windows[1] ~= nil then
          vim.api.nvim_win_close(val.windows[1], true)
          return value.name
        end
      end
    end
  end
  local winnr = vim.fn.win_getid()
  local qfwinid = vim.fn.getqflist({ winid = winnr }).winid
  if qfwinid ~= 0 then
    vim.api.nvim_win_close(qfwinid, true)
    return 'qflist'
  end
  return ''
end

for key, value in pairs(win_kind) do
  M[key] = function()
    local exist_window = close_if_exist()
    if exist_window == value.name then
      return
    end
    vim.fn.execute('sp')
    vim.fn.execute('resize' .. tostring(winsize))
    local toggleterm_buf_found = false
    for idx, val in ipairs(vim.fn.getbufinfo()) do
      if vim.fn.get(vim.fn.split(val.name, '/'), 0, '') == 'term:' then
        if val.variables[key] == true then
          toggleterm_buf_found = true
          vim.api.nvim_set_current_buf(val.bufnr)
        end
      end
    end
    if not toggleterm_buf_found then
      vim.fn.execute('term ' .. (value.cmd or ''))
      vim.fn.execute('setlocal winbar=%#WinBarFileName#' .. value.display_name .. '%*%=')
    end
    vim.fn.execute('setlocal nonumber')
    vim.fn.execute('setlocal signcolumn=no')
    vim.fn.execute('setlocal ft=' .. key)
    vim.fn.execute('let b:' .. key .. '=v:true')
    if vim.fn.mode() == 'n' then
      vim.fn.feedkeys('i')
    end
  end
end

M.ToggleQF = function()
  local exits_window = close_if_exist()
  if exits_window == 'qflist' then
    return
  end
  vim.fn.execute('copen')
  vim.fn.execute('resize' .. tostring(winsize))
  local toggleterm_buf_found = false
  vim.fn.execute('setlocal winbar=%#WinBarFileName#QuickFix%*%=')
  vim.fn.execute('setlocal nonumber')
  vim.fn.execute('setlocal signcolumn=no')
  vim.fn.execute('wincmd p')
end

return M
