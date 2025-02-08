if vim.fn.executable('rust-analyzer') == 0 then
  return
end

require('gen740.plugins.lsps.utils').lsp_setup('rust_analyzer')
