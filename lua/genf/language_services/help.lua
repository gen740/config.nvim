local M = {}

function M.setup()
  vim.api.nvim_win_set_height(0, 18)
  vim.fn.execute('wincmd J')
  vim.opt_local.conceallevel = 3
end

return M
