M = {}

local lsp_status = require('lsp-status')

M.capabilities = (function()
  local capabilities = {}
  if pcall(require, 'cmp_nvim_lsp') then
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  end
  return vim.tbl_extend('keep', capabilities, lsp_status.capabilities)
end)()

M.on_attach = function(client, bufnr)
  require('lsp-inlayhints').on_attach(client, bufnr, true)
  lsp_status.on_attach(client)
  vim.pretty_print(client.id, client.name)
end

M.mason_setup = function()
  if pcall(require, 'mason') then
    require('mason').setup {}
    require('mason-lspconfig').setup {}
  end
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

return M
