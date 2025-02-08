if vim.fn.executable('vtsls') == 0 then
  return
end

require('lspconfig')['vtsls'].setup {
  capabilities = require('gen740.plugins.lsps.utils').capabilities,
  root_dir = require('lspconfig/util').root_pattern(
    'tsconfig.json',
    'package.json',
    'jsconfig.json'
  ),
  single_file_support = false,
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
}
