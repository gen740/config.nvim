local M = {}
local WINSIZE = 18

---@class ConsoleOptions
---@field name string
---@field type "terminal" | "quickfix" | "console"
---@field display_name string
---@field cmd string?
---@field icon string
---@field ft_name string?
---@field bufnr number

---@type table<string, ConsoleOptions>
local Consoles = {
  Ipython = {
    name = 'term://ipython',
    type = 'terminal',
    display_name = 'IPython',
    cmd = [[ipython3]],
    icon = '',
    ft_name = 'terminal',
    bufnr = -1,
  },
  Zsh = {
    name = 'term://zsh',
    type = 'terminal',
    display_name = 'Zsh',
    cmd = '/bin/zsh',
    icon = '',
    ft_name = 'terminal',
    bufnr = -1,
  },
  Quickfix = {
    name = '[Quickfix List]',
    type = 'quickfix',
    display_name = 'Quickfix List',
    cmd = nil,
    icon = '󰞷',
    ft_name = nil,
    bufnr = -1,
  },
  Console = {
    name = 'console://console',
    type = 'console',
    display_name = 'Console',
    cmd = nil,
    icon = '󰞷',
    ft_name = 'console',
    bufnr = -1,
  },
}

---@return string?, number
M.get_exists_terminal = function()
  for key, val in pairs(Consoles) do
    if val.bufnr == -1 or key == 'Console' then
      goto continue
    end
    local winid = vim.fn.bufwinid(val.bufnr)
    if winid ~= -1 then
      return key, winid
    end
    ::continue::
  end
  return nil, -1
end

for key, console in pairs(Consoles) do
  if console.type == 'terminal' then
    M[key] = function()
      local current_win = vim.api.nvim_get_current_win()
      local exists_name, exists_winid = vim.print(M.get_exists_terminal())

      if exists_name == key and exists_winid ~= -1 then
        return
      end

      if console.bufnr == -1 then
        console.bufnr = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_keymap(
          console.bufnr,
          't',
          '<esc><space>',
          [[<c-\><c-n>]],
          { noremap = true, silent = true }
        )

        local jobid = -1

        local chanid = vim.api.nvim_open_term(console.bufnr, {
          on_input = function(_, _, _, data)
            if jobid ~= -1 then
              vim.fn.chansend(jobid, data)
            end
          end,
        })

        jobid = vim.fn.jobstart(console.cmd, {
          pty = true,
          on_stdout = function(_, data, _)
            vim.api.nvim_chan_send(chanid, vim.fn.join(data, '\n'))
          end,
          on_stderr = function(_, data, _)
            vim.api.nvim_chan_send(chanid, vim.fn.join(data, '\n'))
          end,
          on_exit = function(_)
            vim.api.nvim_buf_delete(console.bufnr, { force = true })
          end,
        })
      end

      local winid = -1
      if exists_winid ~= -1 then
        vim.api.nvim_win_set_buf(exists_winid, console.bufnr)
        winid = exists_winid
      else
        local new_win = vim.api.nvim_open_win(console.bufnr, false, {
          split = 'below',
          win = current_win,
          height = WINSIZE,
        })
        vim.fn.win_execute(new_win, 'wincmd J')
        winid = vim.fn.bufwinid(console.bufnr)
      end

      vim.api.nvim_set_option_value('number', false, { win = winid })
      vim.api.nvim_set_option_value('relativenumber', false, { win = winid })
      vim.api.nvim_set_option_value('scrolloff', 0, { win = winid })
      vim.api.nvim_set_option_value(
        'winbar',
        ' %#WinBarFileIcon#'
          .. console.icon
          .. '%* %#WinBarFileName#'
          .. console.display_name
          .. '%*%=',
        { win = winid }
      )
      vim.api.nvim_set_option_value('listchars', [[trail: ]], { win = winid })
    end
  end
end

M.Quickfix = function()
  local current_win = vim.api.nvim_get_current_win()

  Consoles.Quickfix.bufnr = vim.fn.getqflist({ qfbufnr = 1 }).qfbufnr
  local exists_name, exists_winid = M.get_exists_terminal()

  if exists_name == 'Quickfix' and exists_winid ~= -1 then
    return
  end

  if exists_winid ~= -1 then
    if vim.fn.bufexists(Consoles.Quickfix.bufnr) == 0 then
      vim.cmd('copen')
      local qfinfo = vim.fn.getqflist { qfbufnr = 1, winid = 1 }
      Consoles.Quickfix.bufnr = qfinfo.qfbufnr
      vim.api.nvim_win_close(qfinfo.winid, true)
    end
    vim.api.nvim_win_set_buf(exists_winid, Consoles.Quickfix.bufnr)
  end

  vim.cmd('copen ' .. WINSIZE)
  local qfinfo = vim.fn.getqflist { qfbufnr = 1, winid = 1 }
  vim.fn.win_execute(qfinfo.winid, 'wincmd J')
  Consoles.Quickfix.bufnr = qfinfo.qfbufnr
  vim.api.nvim_set_current_win(current_win)
end

M.Console = function()
  local console_winid = vim.fn.bufwinid(Consoles.Console.bufnr)
  if console_winid ~= -1 then
    return Consoles.Console.bufnr
  end

  local _, exists_winid = M.get_exists_terminal()

  if exists_winid == -1 then
    M.Quickfix()
    _, exists_winid = M.get_exists_terminal()
  end

  Consoles.Console.bufnr = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_keymap(
    Consoles.Console.bufnr,
    't',
    '<esc>',
    [[<c-\><c-n>]],
    { noremap = true, silent = true }
  )

  vim.api.nvim_buf_set_name(Consoles.Console.bufnr, 'console://console')
  vim.api.nvim_set_option_value('buftype', 'nofile', { buf = Consoles.Console.bufnr })
  vim.api.nvim_set_option_value('bufhidden', 'hide', { buf = Consoles.Console.bufnr })
  vim.api.nvim_set_option_value('swapfile', false, { buf = Consoles.Console.bufnr })
  vim.api.nvim_set_option_value('filetype', 'console', { buf = Consoles.Console.bufnr })

  local new_win = vim.api.nvim_open_win(Consoles.Console.bufnr, false, {
    split = 'right',
    win = exists_winid,
  })

  vim.api.nvim_set_option_value('number', false, { win = new_win })
  vim.api.nvim_set_option_value('relativenumber', false, { win = new_win })
  vim.api.nvim_set_option_value(
    'winbar',
    ' %#WinBarFileIcon#󰞷%* %#WinBarFileName#Console%*%=',
    { win = new_win }
  )

  return Consoles.Console.bufnr
end

return M
