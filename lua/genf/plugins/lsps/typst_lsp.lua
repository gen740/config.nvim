if vim.fn.executable('typst-lsp') == 0 then
  return
end

require('genf.language_services.utils').lsp_setup('typst_lsp')
