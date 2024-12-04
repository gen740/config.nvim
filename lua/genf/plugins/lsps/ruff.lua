if vim.fn.executable('ruff') == 0 then
  return
end

require('genf.plugins.lsps.utils').lsp_setup('ruff')
