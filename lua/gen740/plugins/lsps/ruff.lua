if vim.fn.executable('ruff') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('ruff')
