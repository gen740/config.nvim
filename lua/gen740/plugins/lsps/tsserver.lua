
if vim.fn.executable('typescript-language-server') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('ts_ls')
