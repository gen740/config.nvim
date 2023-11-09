local lsp_icons = {
  Text = '󰉿',
  Method = '󰆧',
  Function = '󰊕',
  Constructor = '',
  Field = '󰜢',
  Variable = '󰀫',
  Class = '󰠱',
  Interface = '',
  Module = '',
  Property = '󰜢',
  Unit = '󰑭',
  Value = '󰎠',
  Enum = '',
  Keyword = '󰌋',
  Snippet = '',
  Color = '󰏘',
  File = '󰈙',
  Reference = '󰈇',
  Folder = '󰉋',
  EnumMember = '',
  Constant = '󰏿',
  Struct = '󰙅',
  Event = '',
  Operator = '󰆕',
  TypeParameter = '',
}

return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lsp-signature-help' },
    { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-calc' },
    { 'hrsh7th/cmp-vsnip' },
  },
  config = function()
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
        ['<C-e>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            }
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'buffer', keyword_length = 5 },
      },
      formatting = {
        ---@param entry cmp.Entry
        ---@param vim_item vim.CompletedItem
        format = function(entry, vim_item)
          local name = ({
            buffer = '[Buf',
            path = '[PATH',
            nvim_lsp = '[LSP',
            vsnip = '[VSnip',
            nvim_lua = '[Lua',
          })[entry.source.name]

          vim_item.menu = (name or "") .. (vim_item.menu and string.format('(%s)', vim_item.menu) or '') .. ']'

          entry = entry or nil
          vim_item.kind = lsp_icons[vim_item.kind] or vim_item.kind
          local max_length = 60
          if #vim_item.abbr > max_length then
            vim_item.abbr = string.sub(vim_item.abbr, 1, max_length - 1) .. '…'
          end
          return vim_item
        end,
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
