if vim.fn.executable('rust-analyzer') == 0 then
  return
end

require('genf.language_services.utils').lsp_setup('rust_analyzer')
