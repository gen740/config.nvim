local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncbuild('task run')
  end)

  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  lmap('n', '<m-t>', function()
    require('genf.asyncrun').asyncbuild('npm run test')
  end)

  local shiftwidth = 2

  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth
end

function M.lsp_config()
  local lsp_utils = require('genf.language_services.utils')
  require('genf.language_services.utils').lsp_setup('biome')
  require('lspconfig')['denols'].setup {
    capabilities = lsp_utils.capabilities,
    root_dir = require('lspconfig/util').root_pattern('deno.json', 'deno.jsonc'),
    single_file_support = false,
  }
  require('lspconfig')['vtsls'].setup {
    capabilities = lsp_utils.capabilities,
    root_dir = require('lspconfig/util').root_pattern(
      'tsconfig.json',
      'package.json',
      'jsconfig.json'
    ),
    single_file_support = false,
  }
end

return M
