if vim.fn.executable('gopls') == 0 then
  return
end

require('genf.plugins.lsps.utils').lsp_setup('gopls')
