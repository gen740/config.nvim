local M = {}
local winsize = 18

local win_kind = {
  ToggleTerm = { name = 'terminal', display_name = 'Terminal', cmd = nil, icon = '' },
  ToggleIpython3 = {
    name = 'ipython',
    display_name = 'IPython',
    cmd = [[ipython3 -i -c 'import numpy as np;import matplotlib.pyplot as plt']],
    icon = '',
  },
}

---@param ft_name string?
local set_options = function(ft_name)
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.buflisted = false
  vim.opt_local.signcolumn = 'no'
  vim.opt_local.wrap = false
  vim.opt_local.scrolloff = 0

  if ft_name then
    vim.opt_local.ft = ft_name
  end
  vim.keymap.set('t', '<esc><space>', [[<c-\><c-n>]], { buffer = true, noremap = true, silent = true })
  vim.keymap.set(
    't',
    '<esc>sh',
    require('genf.toggleshell').ToggleTerm,
    { buffer = true, noremap = true, silent = true }
  )
  vim.keymap.set(
    't',
    '<esc>py',
    require('genf.toggleshell').ToggleIpython3,
    { buffer = true, noremap = true, silent = true }
  )
end

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
    if close_if_exist() == value.name then
      return
    end
    vim.cmd('sp')
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
      vim.cmd('term ' .. (value.cmd or ''))
      vim.opt_local.winbar =
        string.format(' %%#WinBarFileIcon#%s%%* %%#WinBarFileName#%s%%*%%=', value.icon, value.display_name)
    end
    set_options(key)
    vim.api.nvim_buf_set_var(0, key, true)
    vim.cmd('wincmd J')
    vim.cmd('wincmd p')
  end
end

M.ToggleQF = function()
  if close_if_exist() == 'qflist' then
    return
  end
  vim.cmd('copen')
  vim.api.nvim_win_set_height(0, winsize)
  set_options()
  vim.cmd('wincmd J')
  vim.cmd('wincmd p')
end

return M
