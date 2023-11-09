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
    settings = {
      yaml = {
        schemas = {
          ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
          ['https://json.schemastore.org/clang-format.json'] = '.clang-format',
          ['https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json'] = '.gitlab-ci.y*ml',
          ['https://taskfile.dev/schema.json'] = 'Taskfile.yaml',
          ['https://json.schemastore.org/clangd.json'] = '.clangd',
        },
      },
    },
  }
end

return M
