if vim.fn.executable('taplo') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('taplo')
