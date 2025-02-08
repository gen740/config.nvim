if vim.fn.executable('biome') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('biome')
