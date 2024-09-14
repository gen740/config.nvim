if vim.fn.executable('gopls') == 0 then
  return
end

require('genf.language_services.utils').lsp_setup('gopls')
