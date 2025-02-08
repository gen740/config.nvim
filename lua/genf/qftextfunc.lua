local M = {}

local bufname = vim.fn.bufname

vim.api.nvim_create_augroup('QfSyntax', { clear = true })
vim.api.nvim_create_autocmd({ 'QuickFixCmdPost', 'BufRead' }, {
  callback = function(ft)
    if ft.file == 'quickfix' or ft.event == 'QuickFixCmdPost' then
      local qfwinid = vim.fn.getqflist({ winid = 0 }).winid
      vim.fn.win_execute(qfwinid, 'syntax clear')
      vim.fn.win_execute(qfwinid, 'syntax match ErrorMsg //')
      vim.fn.win_execute(qfwinid, 'syntax match WarningMsg //')
      vim.fn.win_execute(qfwinid, 'syntax match MoreMsg //')

      vim.fn.win_execute(qfwinid, [[syntax match QfFileName /▏\zs.*\ze|[0-9:]*|/]])
      vim.fn.win_execute(qfwinid, [[syntax match QfLineNr /|\zs[0-9:]*\ze|/]])
    end
  end,
  group = 'QfSyntax',
})

M.expr = function(info)
  local res = {}
  if info.quickfix == 1 then
    local qf_list = vim.fn.getqflist({ id = info.id, items = 1 }).items
    for i = info.start_idx, info.end_idx do
      local qf = qf_list[i]
      if not (qf.valid == 1) then
        if qf.text == '' then
          table.insert(res, '  ▏')
        else
          table.insert(res, '  ▏' .. qf.text)
        end
      else
        local line = ''
        if qf.type == 'e' then
          line = ' ▏'
        elseif qf.type == 'w' then
          line = ' ▏'
        else
          line = ' ▏'
        end
        if qf.lnum == 0 then
          line = line .. qf.text
        else
          if qf.bufnr then
            line = line .. bufname(qf.bufnr)
          end
          if qf.lnum ~= 0 then
            line = line .. '|' .. qf.lnum
          end
          if qf.col ~= 0 then
            line = line .. ':' .. qf.lnum
          end
          if qf.lnum ~= 0 then
            line = line .. '|'
          end
          if qf.nr ~= -1 then
            line = line .. ' [E' .. qf.nr .. ']'
          end
          if qf.text ~= '' then
            line = line .. ' ⇒ ' .. qf.text
          end
        end
        table.insert(res, line)
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
          table.insert(
            res,
            string.format('  %s|%s| ⇒ %s', bufname(loc.bufnr), loc.lnum, loc.text)
          )
        end
      end
    end
  end
  return res
end

return M
