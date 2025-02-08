local M = {}

---@param cmd string[]
---@param await boolean | nil
function M.async_format(cmd, await)
  vim.cmd('w')
  local handle = vim.system(
    cmd,
    {},
    vim.schedule_wrap(function()
      local current_line = vim.fn.line('.')
      local win_view = vim.fn.winsaveview()
      vim.cmd('silent e!')
      vim.fn.winrestview(win_view) ---@diagnostic disable-line
      vim.fn.cursor(current_line, 0)
    end)
  )
  if await then
    handle:wait()
  end
end

return M
