local M = {}

function M.setup()
  local lsp_status = require('lsp-status')
  -- lsp_status.register_progress()
  lsp_status.config({
    status_symbol = '',
    current_function = true,
  })
end

return M
