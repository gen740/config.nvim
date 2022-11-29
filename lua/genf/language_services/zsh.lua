local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end)

  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
end

return M
