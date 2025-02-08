if vim.fn.executable('docker-langserver') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('dockerls')
