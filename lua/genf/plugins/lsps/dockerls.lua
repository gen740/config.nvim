if vim.fn.executable('docker-langserver') == 0 then
  return
end

require('genf.language_services.utils').lsp_setup('dockerls')
