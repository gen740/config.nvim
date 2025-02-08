if vim.fn.executable('cmake-language-server') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('cmake')
