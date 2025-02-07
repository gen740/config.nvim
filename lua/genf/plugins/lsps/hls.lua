if vim.fn.executable('haskell-language-server-wrapper') == 0 then
  return
end

require('genf.plugins.lsps.utils').lsp_setup('hls')
