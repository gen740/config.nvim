if vim.fn.executable('haskell-language-server-wrapper') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('hls')
