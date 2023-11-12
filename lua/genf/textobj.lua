local M = {}

local getpos = vim.fn.getpos
local searchpos = vim.fn.searchpos
local set_cursor = vim.api.nvim_win_set_cursor
local line = vim.fn.line

---@param pattern_beg string
---@param pattern_end string
---@param line_wise boolean
local search_pattern = function(pattern_beg, pattern_end, line_wise)
  local current_cur = { getpos('.')[2], getpos('.')[3] }

  if line_wise then
    local start_pos = searchpos(pattern_beg, 'bc', line('.'))
    if start_pos[1] == 0 and start_pos[2] == 0 then
      start_pos = searchpos(pattern_beg, 'c', line('.'))
      if start_pos[1] == 0 and start_pos[2] == 0 then
        set_cursor(0, { current_cur[1], current_cur[2] - 1 })
        return { current_cur, current_cur }
      end
      local end_pos = searchpos(pattern_end, '', line('.'))
      if end_pos[1] == 0 or end_pos[2] == 0 then
        set_cursor(0, { current_cur[1], current_cur[2] - 1 })
        return { current_cur, current_cur }
      end
      set_cursor(0, current_cur)
      return { start_pos, end_pos }
    end
    local end_pos = searchpos(pattern_end, '', line('.'))
    if end_pos[1] == 0 or end_pos[2] == 0 then
      set_cursor(0, { current_cur[1], current_cur[2] - 1 })
      return { current_cur, current_cur }
    end
    set_cursor(0, current_cur)
    return { start_pos, end_pos }
  else
    local start_pos = searchpos(pattern_beg, 'bnc')
    if start_pos[1] == 0 or start_pos[2] == 0 then
      return { current_cur, current_cur }
    end
    local end_pos = searchpos(pattern_end, 'nc')
    if end_pos[1] == 0 or end_pos[2] == 0 then
      return { current_cur, current_cur }
    end
    return { start_pos, end_pos }
  end
end

---@param key string
---@param pattern_beg string
---@param pattern_end string
---@param line_wise boolean
local define_text_object = function(key, pattern_beg, pattern_end, line_wise)
  vim.keymap.set('x', 'a' .. key, function()
    local range = search_pattern(pattern_beg, pattern_end, line_wise)
    local start_pos_cmd = tostring(range[1][1]) .. 'G' .. tostring(range[1][2])
    local end_pos_cmd = tostring(range[2][1]) .. 'G' .. tostring(range[2][2])
    vim.cmd([[normal! v]] .. start_pos_cmd .. '|')
    vim.cmd([[normal! v]] .. end_pos_cmd .. '|')
  end, { noremap = true, silent = true })

  vim.keymap.set('o', 'a' .. key, function()
    local range = search_pattern(pattern_beg, pattern_end, line_wise)
    local start_pos_cmd = tostring(range[1][1]) .. 'G' .. tostring(range[1][2])
    local end_pos_cmd = tostring(range[2][1]) .. 'G' .. tostring(range[2][2])
    vim.cmd([[normal! ]] .. start_pos_cmd .. '|')
    vim.cmd([[normal! v]] .. end_pos_cmd .. '|')
  end, { silent = true, noremap = true })
end

define_text_object('f', 'function(', 'end', false)

return M
