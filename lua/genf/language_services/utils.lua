M = {}

M.capabilities = (function()
  if pcall(require, 'cmp_nvim_lsp') then
    return require('cmp_nvim_lsp').default_capabilities()
  end
end)()

M.on_attach = function(client, bufnr)
  require('lsp-inlayhints').on_attach(client, bufnr, true)
end

M.mason_setup = function()
  if pcall(require, 'mason') then
    require('mason').setup {}
    require('mason-lspconfig').setup {
      ensure_installed = {
        'sumneko_lua',
        'rust_analyzer',
        -- 'clangd',
        'bashls',
      },
    }
  end
end

---@param name string
---@param autostart boolean
function M.lsp_setup(name, autostart)
  if pcall(require, 'lspconfig') then
    local config = require('lspconfig')[name]
    config.setup {
      capabilities = M.capabilities,
      on_attach = M.on_attach,
    }
    if autostart then
      config.launch()
    end
  end
end

return M
