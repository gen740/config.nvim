if vim.fn.executable('gopls') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('gopls')
