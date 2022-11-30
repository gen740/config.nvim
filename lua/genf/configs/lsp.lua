M = {}

function M.setup()
  require('mason').setup {}
  require('mason-lspconfig').setup {}

  local function load_config(name)
    require('genf.language_services.' .. name).lsp_config()
  end

  local languages = { 'python', 'cpp', 'go', 'lua', 'tex', 'json', 'yaml', 'cmake' }

  for _, lang in ipairs(languages) do
    load_config(lang)
  end

  require('lsp-inlayhints').setup {
    inlay_hints = {
      parameter_hints = {
        show = true,
        prefix = '← ',
        separator = ', ',
        remove_colon_start = false,
        remove_colon_end = true,
      },
      type_hints = {
        show = true,
        prefix = '∷ ',
        separator = ', ',
        remove_colon_start = true,
        remove_colon_end = false,
      },
      only_current_line = false,
      labels_separator = ' ',
      max_len_align = false,
      max_len_align_padding = 1,
      -- highlight group
      highlight = 'LspInlayHint',
    },
    enabled_at_startup = true,
    debug_mode = false,
  }
end

return M
