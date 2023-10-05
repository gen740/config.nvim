return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'onsails/lspkind-nvim' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-calc' },
    { 'hrsh7th/cmp-vsnip' },
    { 'neovim/nvim-lspconfig' },
    { 'zbirenbaum/copilot.lua' },
    { 'zbirenbaum/copilot-cmp' },
  },
  config = function()
    require('copilot').setup {
      suggestion = { enabled = false },
      panel = { enabled = false },
    }
    require('copilot_cmp').setup()

    local cmp = require('cmp')

    cmp.setup {
      snippet = {
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body)
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item {},
        ['<C-n>'] = cmp.mapping.select_next_item {},
        ['<C-c>'] = cmp.mapping.abort(),
        ['<C-t>'] = cmp.mapping(function(fallback)
          if vim.fn['vsnip#available'](1) == 1 then
            cmp.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            }
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'copilot' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'buffer', keyword_length = 5 },
      },
      formatting = {
        format = require('lspkind').cmp_format {
          mode = 'symbol',
          maxwidth = 50,
          symbol_map = {
            Copilot = '',
          },
          before = function(entry, vim_item)
            vim_item.menu = ({
              buffer = '[Buf]',
              path = '[PATH]',
              nvim_lsp = '[LSP]',
              vsnip = '[VSnip]',
              nvim_lua = '[Lua]',
              latex_symbols = '[Latex]',
              copilot = '[copilot]',
            })[entry.source.name]

            vim_item.dup = ({
              buffer = 0,
            })[entry.source.name] or 0

            return vim_item
          end,
        },
      },
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.kind,
          cmp.config.compare.offset,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.locality,
          require('copilot_cmp.comparators').prioritize,
          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find('^_+')
            local _, entry2_under = entry2.completion_item.label:find('^_+')
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end, -- underline
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    }
  end,
}
