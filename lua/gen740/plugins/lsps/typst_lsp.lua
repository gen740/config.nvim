if vim.fn.executable('typst-lsp') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('typst_lsp')
