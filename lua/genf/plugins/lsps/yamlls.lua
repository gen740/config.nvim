if vim.fn.executable('yaml-language-server') == 0 then
  return
end

require('lspconfig')['yamlls'].setup {
  capabilities = require('genf.plugins.lsps.utils').capabilities,
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
