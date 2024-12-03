if vim.fn.executable('ruff') == 0 then
  return
end

require('genf.language_services.utils').lsp_setup('ruff')
