if vim.fn.executable('deno') == 0 then
  return
end

require('lspconfig')['denols'].setup {
  capabilities = require('gen740.plugins.lsps.utils').capabilities,
  root_dir = require('lspconfig/util').root_pattern('deno.json', 'deno.jsonc'),
  single_file_support = false,
}
