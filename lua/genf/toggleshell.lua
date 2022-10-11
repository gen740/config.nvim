local M = {}
local winsize = 15

local close_if_exists = function()
  for idx, val in ipairs(vim.fn.getbufinfo()) do
    if vim.fn.get(vim.fn.split(val.name, '/'), 0, '') == 'term:' then
      if (val.variables.ToggleTerm == true) and val.windows[1] ~= nil then
        vim.api.nvim_win_close(val.windows[1], true)
        return 'terminal'
      elseif (val.variables.ToggleIpython3 == true) and val.windows[1] ~= nil then
        vim.api.nvim_win_close(val.windows[1], true)
        return 'ipython'
      elseif (val.variables.ToggleJulia == true) and val.windows[1] ~= nil then
        vim.api.nvim_win_close(val.windows[1], true)
        return 'julia'
      end
    end
  end
  local winnr = vim.fn.win_getid()
  local bufnr = vim.api.nvim_win_get_buf(winnr)
  local qfwinid = vim.fn.getqflist({ winid = winnr }).winid
  if qfwinid ~= 0 then
    vim.api.nvim_win_close(qfwinid, true)
    return 'qflist'
  end
  return ''
end

M.toggleterm = function()
  -- local cur_winheight = vim.fn.getwininfo()[vim.fn.winnr()].height
  local exits_window = close_if_exists()
  if exits_window == 'terminal' then
    return
  end
  vim.fn.execute('sp')
  vim.fn.execute('resize' .. tostring(winsize))
  local toggleterm_buf_found = false
  for idx, val in ipairs(vim.fn.getbufinfo()) do
    if vim.fn.get(vim.fn.split(val.name, '/'), 0, '') == 'term:' then
      if val.variables.ToggleTerm == true then
        toggleterm_buf_found = true
        vim.api.nvim_set_current_buf(val.bufnr)
      end
    end
  end
  if not toggleterm_buf_found then
    vim.fn.execute('term')
    vim.fn.execute('setlocal winbar=%#WinBarFileName#Terminal%*%=')
  end
  vim.fn.execute('setlocal nonumber')
  vim.fn.execute('setlocal signcolumn=no')
  vim.fn.execute('setlocal ft=ToggleTerm')
  vim.fn.execute('let b:ToggleTerm=v:true')
  if vim.fn.mode() == 'n' then
    vim.fn.feedkeys('i')
  end
end

M.toggleipython3 = function()
  -- local cur_winheight = vim.fn.getwininfo()[vim.fn.winnr()].height
  local exits_window = close_if_exists()
  if exits_window == 'ipython' then
    return
  end
  vim.fn.execute('sp')
  vim.fn.execute('resize' .. tostring(winsize))
  local toggleterm_buf_found = false
  for idx, val in ipairs(vim.fn.getbufinfo()) do
    if vim.fn.get(vim.fn.split(val.name, '/'), 0, '') == 'term:' then
      if val.variables.ToggleIpython3 == true then
        toggleterm_buf_found = true
        vim.api.nvim_set_current_buf(val.bufnr)
      end
    end
  end
  if not toggleterm_buf_found then
    vim.fn.execute('term ipython3')
    vim.fn.execute('setlocal winbar=%#WinBarFileName#Ipython3%*%=')
  end
  vim.fn.execute('setlocal nonumber')
  vim.fn.execute('setlocal signcolumn=no')
  vim.fn.execute('setlocal ft=ToggleIpython3')
  vim.fn.execute('let b:ToggleIpython3=v:true')
  if vim.fn.mode() == 'n' then
    vim.fn.feedkeys('i')
  end
end

M.togglejulia = function()
  local exits_window = close_if_exists()
  if exits_window == 'julia' then
    return
  end
  vim.fn.execute('sp')
  vim.fn.execute('resize' .. tostring(winsize))
  local toggleterm_buf_found = false
  for idx, val in ipairs(vim.fn.getbufinfo()) do
    if vim.fn.get(vim.fn.split(val.name, '/'), 0, '') == 'term:' then
      if val.variables.ToggleJulia == true then
        toggleterm_buf_found = true
        vim.api.nvim_set_current_buf(val.bufnr)
      end
    end
  end
  if not toggleterm_buf_found then
    vim.fn.execute('term julia')
    vim.fn.execute('setlocal winbar=%#WinBarFileName#Julia%*%=')
  end
  vim.fn.execute('setlocal nonumber')
  vim.fn.execute('setlocal signcolumn=no')
  vim.fn.execute('setlocal ft=ToggleJulia')
  vim.fn.execute('let b:ToggleJulia=v:true')
  if vim.fn.mode() == 'n' then
    vim.fn.feedkeys('i')
  end
end

M.toggleqfwin = function()
  -- local cur_winheight = vim.fn.getwininfo()[vim.fn.winnr()].height
  local exits_window = close_if_exists()
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
