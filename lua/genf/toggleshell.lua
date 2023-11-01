local M = {}
local winsize = 18

local win_kind = {
  ToggleTerm = { name = 'terminal', display_name = 'Terminal', cmd = nil },
  ToggleIpython3 = {
    name = 'ipython',
    display_name = 'Ipython',
    cmd = [[ipython3 -i -c 'import numpy as np;import matplotlib.pyplot as plt']],
  },
}

local close_if_exist = function()
  for _, val in ipairs(vim.fn.getbufinfo()) do
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
    vim.fn.execute('wincmd J')
    vim.api.nvim_win_set_height(0, winsize)
    local toggleterm_buf_found = false
    for _, val in ipairs(vim.fn.getbufinfo()) do
      if vim.fn.get(vim.fn.split(val.name, '/'), 0, '') == 'term:' then
        if val.variables[key] == true then
          toggleterm_buf_found = true
          vim.api.nvim_set_current_buf(val.bufnr)
        end
      end
    end
    if not toggleterm_buf_found then
      vim.fn.execute('term ' .. (value.cmd or ''))
      vim.fn.execute(
        'setlocal winbar=%#WinBarFileName#' .. value.display_name .. '%*%='
      )
    end
    vim.opt_local.number = false
    vim.opt_local.buflisted = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
    vim.opt_local.wrap = false
    vim.opt_local.ft = key
    vim.api.nvim_buf_set_var(0, key, true)
  end
end

M.ToggleQF = function()
  local exits_window = close_if_exist()
  if exits_window == 'qflist' then
    return
  end
  vim.fn.execute('copen')
  vim.api.nvim_win_set_height(0, winsize)
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.signcolumn = 'no'
  vim.opt_local.buflisted = false
  vim.opt_local.wrap = false
  vim.fn.execute('wincmd p')
end

return M
