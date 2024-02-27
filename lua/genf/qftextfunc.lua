local M = {}

local bufname = vim.fn.bufname

M.expr = function(info)
  local res = {}
  if info.quickfix == 1 then
    local qf_list = vim.fn.getqflist({ id = info.id, items = 1 }).items
    for i = info.start_idx, info.end_idx do
      local qf = qf_list[i]
      if not (qf.valid == 1) then
        if qf.text == '' then
          table.insert(res, '  ┊')
        else
          table.insert(res, '  ┊' .. qf.text)
        end
      else
        if qf.bufnr == 0 and qf.lnum == 0 then
          table.insert(res, ' ┊ ' .. qf.text)
        elseif qf.type == 'e' then
          if qf.nr ~= -1 then
            table.insert(
              res,
              string.format(' ┊ %s|%s:%s| [E%s] ⇒ %s', bufname(qf.bufnr), qf.lnum, qf.col, qf.nr, qf.text)
            )
          else
            table.insert(res, string.format(' ┊ %s|%s:%s| ⇒ %s', bufname(qf.bufnr), qf.lnum, qf.col, qf.text))
          end
        elseif qf.type == 'w' then
          table.insert(res, string.format(' ┊ %s|%s:%s| ⇒ %s', bufname(qf.bufnr), qf.lnum, qf.col, qf.text))
        else
          table.insert(res, string.format(' ┊ %s|%s:%s| ⇒ %s', bufname(qf.bufnr), qf.lnum, qf.col, qf.text))
        end
      end
    end
  else
    local loc_list = vim.fn.getloclist(0, { all = 0 }).items
    for i = info.start_idx, info.end_idx do
      local loc = loc_list[i]
      if not (loc.valid == 1) then
        table.insert(res, '' .. loc.text)
      else
        if loc.bufnr == 0 and loc.lnum == 0 then
          table.insert(res, '  ' .. ' ⇒ ' .. loc.text)
        else
          table.insert(res, string.format('  %s|%s| ⇒ %s', bufname(loc.bufnr), loc.lnum, loc.text))
        end
      end
    end
  end
  return res
end

return M
