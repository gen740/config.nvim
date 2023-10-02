local M = {}

M.dir_exists = function(path)
  if type(path) ~= 'string' then
    error('input error')
    return false
  end
  local response = os.execute('cd ' .. path .. ' 2> /dev/null')
  if response == 0 or response == true then
    return true
  end
  return false
end

_G.QfTextFunc = function(info)
  local l = {}
  if info.quickfix == 1 then
    local qflist = vim.fn.getqflist({ id = info.id, items = 1 }).items
    for idx, val in ipairs(qflist) do
      if not (val.valid == 1) then
        l[#l + 1] = '┃ ' .. val.text:gsub('|', '┃')
      else
        if val.bufnr == 0 and val.lnum == 0 then
          l[#l + 1] = ' כֿ  ⇒ ' .. val.text
        elseif val.type == 'e' then
          l[#l + 1] =
            string.format('  %s|%s| ⇒ %s', vim.fn.bufname(val.bufnr), val.lnum, val.text)
        elseif val.type == 'w' then
          l[#l + 1] =
            string.format('  %s|%s| ⇒ %s', vim.fn.bufname(val.bufnr), val.lnum, val.text)
        else
          l[#l + 1] =
            string.format(' כֿ %s|%s| ⇒ %s', vim.fn.bufname(val.bufnr), val.lnum, val.text)
        end
      end
    end
    if vim.fn.len(l) == 0 then
      return {}
    end
    return l
  else
    local loclist = vim.fn.getloclist(0, { all = 0 }).items
    for idx, val in ipairs(loclist) do
      if not (val.valid == 1) then
        l[#l + 1] = '┃ ' .. val.text:gsub('|', '┃')
      else
        if val.bufnr == 0 and val.lnum == 0 then
          l[#l + 1] = ' כֿ ' .. ' ⇒ ' .. val.text
        else
          l[#l + 1] =
            string.format('  %s|%s| ⇒ %s', vim.fn.bufname(val.bufnr), val.lnum, val.text)
        end
      end
    end
    if vim.fn.len(l) == 0 then
      return {}
    end
    return l
  end
end

return M
