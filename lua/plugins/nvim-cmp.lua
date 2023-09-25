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
  },
  config = function()
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0
        and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
          == nil
    end
    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end
    local cmp = require('cmp')

    cmp.setup {
      snippet = {
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item {},
        ['<C-n>'] = cmp.mapping.select_next_item {},
        ['<C-c>'] = cmp.mapping.abort(),
        ['<C-t>'] = cmp.mapping(function(fallback)
          if vim.fn['vsnip#available'](1) == 1 then
            feedkey('<Plug>(vsnip-expand-or-jump)', '')
          else
            cmp.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            }
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'copilot' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'path' },
        { name = 'vsnip' },
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
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          cmp.config.compare.offset,
          cmp.config.compare.locality,
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
          -- cmp.config.compare.kind,
          cmp.config.compare.length,
          cmp.config.compare.sort_text,
          cmp.config.compare.order,
        },
      },
    }
  end,
}
