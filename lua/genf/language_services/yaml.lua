local M = {}

local lmap = require('genf.language_services.utils').set_local_map
local async_format = require('genf.language_services.utils').async_format

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2

  lmap('n', '<space>f', function()
    async_format { 'yamlfmt', vim.fn.expand('%:p') }
  end)
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
          ['https://raw.githubusercontent.com/common-workflow-lab/cwl-ts-auto/main/json_schemas/cwl_schema.json'] = '*.cwl',
        },
      },
    },
  }
end

return M
