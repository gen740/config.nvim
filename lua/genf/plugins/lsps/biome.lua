if vim.fn.executable('biome') == 0 then
  return
end

require('genf.plugins.lsps.utils').lsp_setup('biome')
