local M = {}

M.alignby = function(opts)
  local delimiter = opts.fargs[1]

  local start_line = opts.line1
  local end_line = opts.line2

  local text = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local min_indent = 100

  for _, line in ipairs(text) do
    local indent = line:find('%S')
    if indent ~= nil then
      indent = indent - 1
      if indent then
        min_indent = math.min(min_indent, indent)
      end
    end
  end

  local split_text = vim.tbl_map(function(line)
    return vim.tbl_map(function(word)
      return word:gsub('^%s*(.-)%s*$', '%1')
    end, vim.split(line, delimiter))
  end, text)

  local counter = 1
  local spaces = {}
  while true do
    local max_length = nil
    for _, line in ipairs(split_text) do
      if line[counter] then
        max_length = math.max(max_length or 0, #line[counter])
      end
    end

    if max_length == nil then
      break
    end
    spaces[counter] = max_length
    counter = counter + 1
  end

  for i, line in ipairs(split_text) do
    local new_line = ''
    for j, word in ipairs(line) do
      new_line = new_line .. word .. string.rep(' ', spaces[j] - #word)
      if j ~= #line then
        new_line = new_line .. delimiter .. ' '
      end
    end
    split_text[i] = new_line
  end
  split_text = vim.tbl_map(function(line)
    return (string.rep(' ', min_indent) .. line):gsub('(.-)%s*$', '%1')
  end, split_text)
  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, split_text)
end

return M
