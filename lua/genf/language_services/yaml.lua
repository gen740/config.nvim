local M = {}

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

function M.lsp_config()
  local lsp_utils = require('genf.language_services.utils')
  local config = require('lspconfig')['yamlls']
  config.setup {
    capabilities = lsp_utils.capabilities,
    on_attach = lsp_utils.on_attach,
    settings = {
      yaml = {
        schemas = {
          ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
          ['https://json.schemastore.org/clang-format.json'] = '.clang-format',
          ['https://taskfile.dev/schema.json'] = 'Taskfile.yaml',
        },
      },
    },
  }
end

return M
