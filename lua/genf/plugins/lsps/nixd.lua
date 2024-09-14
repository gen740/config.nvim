if vim.fn.executable('nixd') == 0 then
  return
end

local lsp_utils = require('genf.language_services.utils')
require('lspconfig')['nixd'].setup {
  capabilities = lsp_utils.capabilities,
  cmd = { 'nixd' },
  settings = {
    nixd = {
      nixpkgs = {
        expr = 'import <nixpkgs> { }',
      },
      formatting = {
        command = { 'nixpkgs-fmt' },
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
        },
        home_manager = {
          expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
        },
      },
    },
  },
}
