local fn = vim.fn
local api = vim.api

M = {}

local function get_args()
  local cur_pos = api.nvim_win_get_cursor(0)
	local lnr_from = fn.search([[^pandoc_:$]])
  local lnr_until = fn.search([[^\S]]) - 1
  local lines = api.nvim_buf_get_lines(0, lnr_from, lnr_until, true)
  local parameters = {}
  for _,v in ipairs(lines) do
    local line = string.sub(v, 5)
	  local key, value = string.match(line, '^(.*): (.*)')
    parameters[key] = value
  end
  api.nvim_win_set_cursor(0, cur_pos)
  local args = {'--output=' .. fn.expand([[%:p:r]]) .. '.' .. parameters['to']}
  for k,v in pairs(parameters) do
    if v == 'true' then
      table.insert(args, '--' .. k)
    else
      table.insert(args, '--' .. k .. '=' .. v)
    end
  end
  table.insert(args, fn.expand([[%:p]]))
  return args
end

function M.run_pandoc()
  if fn.search([[^pandoc_:$]], 'n') == 0 then
    print('Pandoc yaml block missing!')
    return
  end
  local Job = require('plenary.job')
  local args = get_args()
  Job:new({
    command = 'pandoc',
    args = args,
    on_exit = function(j, return_val)
      if return_val == 0 then
        print('Pandoc conversion complete')
      else
        print('Pandoc conversion error: ' .. j:stderr_result()[1])
      end
    end,
  }):start()
end

return M
