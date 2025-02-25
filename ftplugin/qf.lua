vim.opt_local.buflisted = false

vim.keymap.set('n', 'd', function()
  local qflist = vim.fn.getqflist()
  local qf_len = #qflist
  local new_qflist = {}
  local current_line = vim.fn.line('.')
  for idx, item in ipairs(qflist) do
    if idx ~= current_line then
      table.insert(new_qflist, item)
    end
  end
  vim.fn.setqflist(new_qflist, 'r')
  vim.api.nvim_win_set_cursor(0, { math.max(math.min(current_line, qf_len - 1), 1), 0 })
end, { buffer = true })
