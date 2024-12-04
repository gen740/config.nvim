if vim.fn.executable('cmake-language-server') == 0 then
  return
end

require('genf.plugins.lsps.utils').lsp_setup('cmake')
