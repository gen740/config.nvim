local M = {}

local f = vim.fn

M.expr = function(info)
  local res = {}
  if info.quickfix == 1 then
    local qflist = f.getqflist({ id = info.id, items = 1 }).items
    for i = info.start_idx, info.end_idx do
      local val = qflist[i]
      if not (val.valid == 1) then
        table.insert(res, '' .. string.gsub(val.text, '|', ' '))
      else
        if val.bufnr == 0 and val.lnum == 0 then
          table.insert(res, ' כֿ  ⇒ ' .. val.text)
        elseif val.type == 'e' then
          table.insert(res, string.format(' %s|%s| ⇒ %s', f.bufname(val.bufnr), val.lnum, val.text))
        elseif val.type == 'w' then
          table.insert(res, string.format(' %s|%s| ⇒ %s', f.bufname(val.bufnr), val.lnum, val.text))
        else
          table.insert(res, string.format('כֿ %s|%s| ⇒ %s', f.bufname(val.bufnr), val.lnum, val.text))
        end
      end
    end
    return res
  else
    local loclist = f.getloclist(0, { all = 0 }).items
    for i = info.start_idx, info.end_idx do
      local val = loclist[i]
      if not (val.valid == 1) then
        table.insert(res, '' .. val.text)
      else
        if val.bufnr == 0 and val.lnum == 0 then
          table.insert(res, ' כֿ ' .. ' ⇒ ' .. val.text)
        else
          table.insert(res, string.format('  %s|%s| ⇒ %s', f.bufname(val.bufnr), val.lnum, val.text))
        end
      end
    end
    if #res == 0 then
      return {}
    end
    return res
  end
end

return M
