local M = {}

function M.setup()
  vim.keymap.set('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task execute')
  end)

  vim.keymap.set('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  local shiftwidth = 2

  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth
end

local lsp_utils = require('genf.language_services.utils')

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('tsserver')
end

return M
