local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4

  vim.opt_local.formatexpr = 'jpfmt#formatexpr()'
  vim.opt_local.listchars = [[tab:┈┈,trail:~]]
  vim.opt_local.colorcolumn = '0'
  vim.opt_local.commentstring = '<!--%s-->'

  lmap('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end)

  lmap('n', '<space>jf', '<cmd>silent JpFormatAll<cr>')
  lmap('n', '<space>jj', '<cmd>silent JpJoinAll<cr>')
end

return M
