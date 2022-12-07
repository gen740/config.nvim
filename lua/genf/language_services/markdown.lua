local M = {}

function M.setp()
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4

  vim.opt_local.formatexpr = 'jpfmt#formatexpr()'
  vim.opt_local.listchars = [[tab:┈┈,trail:~]]
  vim.opt_local.colorcolumn = '0'
  -- vim.opt_local.commentstring = '<!--%s-->'

  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end)

  vim.keymap.set('n', '<space>jf', '<cmd>silent JpFormatAll<cr>')
  vim.keymap.set('n', '<space>jj', '<cmd>silent JpJoinAll<cr>')

  -- local autocmd = vim.api.nvim_create_autocmd
  -- local augroup = vim.api.nvim_create_augroup
  -- vim.api.nvim_set_hl(0, key, val)
end

return M
