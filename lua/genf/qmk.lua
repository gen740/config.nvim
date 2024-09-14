local M = {}

---@param e any
---@param n number
---@return table
local create_identity = function(e, n)
  local identity = {}
  for i = 1, n do
    identity[i] = e
  end
  return identity
end

---@param t table
---@param start_n number
---@param end_n number
local sum = function(t, start_n, end_n)
  local res = 0
  for i = start_n, math.min(end_n, #t) do
    res = res + t[i]
  end
  return res
end

-- Make a keymap more readable by aligning the keys.
M.align_keymap = function(opts)
  local start_line = opts.line1
  local end_line = opts.line2

  if end_line - start_line ~= 8 then
    error('Invalid number of lines')
  end

  local text = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local key_rows = {
    text[2],
    text[4],
    text[6],
    text[8],
  }
  key_rows = vim.tbl_map(function(line)
    return vim.tbl_map(function(word)
      return word:gsub([[%*/]], ''):gsub([[/%*]], ''):gsub('//', ''):gsub('^%s*(.-)%s*$', '%1')
    end, vim.split(line, ','))
  end, key_rows)

  local key_width = create_identity(9, 14)

  local aligned_txt = {}

  local line = ''

  local pack_key = function(key, i)
    local half = math.ceil((i - #key) / 2)
    if half < 0 then
      return key
    end
    return string.rep(' ', (i - #key) - half) .. key .. string.rep(' ', half)
  end
  --- First row
  line = '┏'
  for i = 1, 7 do
    if i == 7 then
      line = line .. string.rep('━', key_width[i]) .. '┓'
    else
      line = line .. string.rep('━', key_width[i]) .. '┳'
    end
  end
  line = line .. ' ┏'
  for i = 8, 14 do
    if i == 14 then
      line = line .. string.rep('━', key_width[i]) .. '┓'
    else
      line = line .. string.rep('━', key_width[i]) .. '┳'
    end
  end
  table.insert(aligned_txt, line)

  --- 2nd row (Keys)
  line = ' '
  for i = 1, 7 do
    local key = key_rows[1][i]
    line = line .. pack_key(key, key_width[i]) .. ','
  end
  line = line .. '  '
  for i = 8, 14 do
    local key = key_rows[1][i]
    line = line .. pack_key(key, key_width[i]) .. ','
  end
  table.insert(aligned_txt, line)

  --- 3rd row
  line = '┣'
  for i = 1, 7 do
    if i == 7 then
      line = line .. string.rep('━', key_width[i]) .. '┫'
    else
      line = line .. string.rep('━', key_width[i]) .. '╋'
    end
  end
  line = line .. ' ┣'
  for i = 8, 14 do
    if i == 14 then
      line = line .. string.rep('━', key_width[i]) .. '┫'
    else
      line = line .. string.rep('━', key_width[i]) .. '╋'
    end
  end
  table.insert(aligned_txt, line)

  --- 4th row (Keys)
  line = ' '
  for i = 1, 7 do
    local key = key_rows[2][i]
    line = line .. pack_key(key, key_width[i]) .. ','
  end
  line = line .. '  '
  for i = 8, 14 do
    local key = key_rows[2][i]
    line = line .. pack_key(key, key_width[i]) .. ','
  end
  table.insert(aligned_txt, line)

  --- 5th row
  line = '┣'
  for i = 1, 7 do
    if i == 7 then
      line = line .. string.rep('━', key_width[i]) .. '┛'
    else
      line = line .. string.rep('━', key_width[i]) .. '╋'
    end
  end
  line = line .. ' ┗'
  for i = 8, 14 do
    if i == 14 then
      line = line .. string.rep('━', key_width[i]) .. '┫'
    else
      line = line .. string.rep('━', key_width[i]) .. '╋'
    end
  end
  table.insert(aligned_txt, line)

  --- 6th row (Keys)
  line = ' '
  for i = 1, 7 do
    if i ~= 7 then
      local key = key_rows[3][i]
      line = line .. pack_key(key, key_width[i]) .. ','
    else
      line = line .. string.rep(' ', key_width[i] + 1)
    end
  end
  line = line .. '  '
  for i = 8, 14 do
    if i == 8 then
      line = line .. string.rep(' ', key_width[i] + 1)
    else
      local key = key_rows[3][i - 2]
      line = line .. pack_key(key, key_width[i]) .. ','
    end
  end
  table.insert(aligned_txt, line)

  --- 7th row
  line = '┗'
  for i = 1, 7 do
    if i == 7 then
      line = line .. string.rep('━', key_width[i]) .. '┓'
    elseif i > 3 then
      line = line .. string.rep('━', key_width[i]) .. '╋'
    else
      line = line .. string.rep('━', key_width[i]) .. '┻'
    end
  end
  line = line .. ' ┏'
  for i = 8, 14 do
    if i == 14 then
      line = line .. string.rep('━', key_width[i]) .. '┛'
    elseif i < 11 then
      line = line .. string.rep('━', key_width[i]) .. '╋'
    else
      line = line .. string.rep('━', key_width[i]) .. '┻'
    end
  end
  table.insert(aligned_txt, line)

  --- 8th row (Keys)
  line = ' '
  for i = 1, 7 do
    if i < 5 then
      line = line .. string.rep(' ', key_width[i] + 1)
    else
      local key = key_rows[4][i - 4]
      line = line .. pack_key(key, key_width[i]) .. ','
    end
  end
  line = line .. '  '
  for i = 8, 14 do
    if i < 11 then
      local key = key_rows[4][i - 4]
      if i == 10 then
        line = line .. pack_key(key, key_width[i])
      else
        line = line .. pack_key(key, key_width[i]) .. ','
      end
    else
      line = line .. string.rep(' ', key_width[i] + 1)
    end
  end
  table.insert(aligned_txt, line)

  --- 9th row
  line = string.rep(' ', sum(key_width, 1, 4) + 4)
    .. '┗'
    .. string.rep('━', key_width[5])
    .. '┻'
    .. string.rep('━', key_width[6])
    .. '┻'
    .. string.rep('━', key_width[7])
    .. '┛ ┗'
    .. string.rep('━', key_width[8])
    .. '┻'
    .. string.rep('━', key_width[9])
    .. '┻'
    .. string.rep('━', key_width[10])
    .. '┛'
    .. string.rep(' ', sum(key_width, 11, 14) + 4)
  table.insert(aligned_txt, line)

  for i, l in ipairs(aligned_txt) do
    if i == 8 then
      aligned_txt[i] = '    ' .. l .. '   /*'
    elseif i % 2 == 0 then
      aligned_txt[i] = '    ' .. l .. '  /*'
    else
      aligned_txt[i] = '    ' .. l .. '  */'
    end
    if i == 9 then
      aligned_txt[i] = aligned_txt[i] .. ' ),'
    end
  end

  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, aligned_txt)
end

return M
