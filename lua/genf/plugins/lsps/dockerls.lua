if vim.fn.executable('docker-langserver') == 0 then
  return
end

require('genf.plugins.lsps.utils').lsp_setup('dockerls')
