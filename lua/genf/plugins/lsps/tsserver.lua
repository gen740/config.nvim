
if vim.fn.executable('typescript-language-server') == 0 then
  return
end

require('genf.plugins.lsps.utils').lsp_setup('ts_ls')
