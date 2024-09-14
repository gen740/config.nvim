if vim.fn.executable('biome') == 0 then
  return
end

require('genf.language_services.utils').lsp_setup('biome')
