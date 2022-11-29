M = {}

local function lsp_on_attach(client, bufnr)
  require('lsp-inlayhints').on_attach(client, bufnr, true)
end

function M.inlay_hints()
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

function M.mason()
  require('mason').setup {}
  require('mason-lspconfig').setup {}
end

-- local servers = {
--   'tsserver',
--   'dockerls',
--   'texlab',
--   'gopls',
--   'perlnavigator',
--   'cmake',
--   'julials',
--   'zls',
--   'hls',
-- }

return {
  setup = function()
    M.mason()
    M.inlay_hints()
  end,
}
