if vim.fn.executable('cmake-language-server') == 0 then
  return
end

require('genf.language_services.utils').lsp_setup('cmake')
