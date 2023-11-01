M = {}

local lsp_status = require('lsp-status')

M.capabilities = (function()
  local capabilities = {}
  if pcall(require, 'cmp_nvim_lsp') then
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  end
  return vim.tbl_extend('keep', capabilities, lsp_status.capabilities)
end)()

M.on_attach = function(client, _)
  lsp_status.on_attach(client)
end

---@param name string
function M.lsp_setup(name)
  if pcall(require, 'lspconfig') then
    local config = require('lspconfig')[name]
    config.setup {
      capabilities = M.capabilities,
      on_attach = M.on_attach,
    }
  end
end

---@param mode string
---@param map string
---@param callback string|function
function M.set_local_map(mode, map, callback)
  vim.keymap.set(mode, map, callback, { buffer = true })
end

---@param cmd string
function M.async_format(cmd)
  vim.cmd('w')
  require('genf.asyncrun').asyncrun(cmd, function()
    local current_line = vim.fn.line('.')
    local win_view = vim.fn.winsaveview()
    vim.cmd('silent e!')
    vim.fn.winrestview(win_view)
    vim.fn.cursor(current_line, 0)
  end, true)
end

return M
