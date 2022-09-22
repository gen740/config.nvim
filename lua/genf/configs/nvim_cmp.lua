return {
  nvim_cmp = function()
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn['UltiSnips#Anon'](args.body)
        end,
      },
      mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ["<C-c>"] = cmp.mapping.complete(),
        ['<C-o>'] = cmp.mapping.close(),
        ['<C-t>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'path' },
        { name = 'ultisnips' },
        { name = 'calc' },
      },
      formatting = {
        format = require('lspkind').cmp_format({
          mode = 'symbol',
          maxwidth = 50,
          before = function(entry, vim_item)
            vim_item.menu = ({
              buffer = '[Buf]',
              nvim_lsp = '[LSP]',
              ultisnips = '[USnips]',
              nvim_lua = '[Lua]',
              latex_symbols = '[Latex]',
            })[entry.source.name]
            return vim_item
          end,
        }),
      },
      sorting = {
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          cmp.config.compare.offset,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })
  end,
}
