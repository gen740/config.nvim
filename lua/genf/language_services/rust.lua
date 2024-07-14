local M = {}

function M.setup()
  local efm = ''
  efm = efm .. '%E%trror: %m,%C --> %f:%l:%c,%Z,'
  efm = efm .. '%E%trror[E%n]: %m,%C --> %f:%l:%c,%Z,'
  efm = efm .. '%W%tarning: %m,%C  --> %f:%l:%c,%Z,'
  efm = efm .. "thread 'main' %m at %f:%l:%c:,"

  vim.opt_local.tabstop = 4
  vim.opt_local.softtabstop = 4
  vim.opt_local.shiftwidth = 4
  vim.opt_local.makeprg = 'cargo'

  vim.cmd('compiler cargo')
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('rust_analyzer')
end

return M
