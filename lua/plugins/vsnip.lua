---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'hrsh7th/vim-vsnip',
  dependencies = { 'hrsh7th/vim-vsnip-integ' },
  event = 'InsertEnter',
  cmd = { 'VsnipOpen' },
  config = function()
    vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'
    vim.keymap.set({ 'i', 's' }, '<c-f>', function()
      if vim.fn['vsnip#jumpable'](1) == 1 then
        return '<Plug>(vsnip-jump-next)'
      else
        return '<c-f>'
      end
    end, { noremap = true, silent = true, expr = true })

    vim.keymap.set({ 'i', 's' }, '<c-b>', function()
      if vim.fn['vsnip#jumpable'](-1) == 1 then
        return '<Plug>(vsnip-jump-prev)'
      else
        return '<c-b>'
      end
    end, { noremap = true, silent = true, expr = true })

    vim.keymap.set({ 'i', 's' }, '<tab>', function()
      if vim.fn['vsnip#available']() == 1 then
        return '<Plug>(vsnip-expand)'
      else
        return '<tab>'
      end
    end, { noremap = true, silent = true, expr = true })
  end,
}
