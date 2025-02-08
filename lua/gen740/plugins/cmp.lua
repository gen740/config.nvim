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

local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    -- ['<C-e>'] = cmp.mapping(function()
    --   cmp.confirm {
    --     behavior = cmp.ConfirmBehavior.Replace,
    --     select = true,
    --   }
    -- end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
  },
  formatting = {
    ---@param entry cmp.Entry
    ---@param vim_item vim.CompletedItem
    format = function(entry, vim_item)
      local max_length = 50
      vim_item.menu = ({
        path = '[PATH]',
        nvim_lsp = '[LSP]',
        vsnip = '[SNIP]',
      })[entry.source.name]
      vim_item.kind = lsp_icons[vim_item.kind] or vim_item.kind
      if #vim_item.abbr > max_length then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_length - 1) .. '…'
      end
      return vim_item
    end,
  },
}
