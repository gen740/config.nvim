if vim.fn.executable('typst-lsp') == 0 then
  return
end

require('genf.plugins.lsps.utils').lsp_setup('typst_lsp')
