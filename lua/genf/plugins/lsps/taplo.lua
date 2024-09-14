if vim.fn.executable('taplo') == 0 then
  return
end

require('genf.language_services.utils').lsp_setup('taplo')
