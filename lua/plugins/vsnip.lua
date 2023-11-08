return {
  {
    'hrsh7th/vim-vsnip',
    dependencies = { 'hrsh7th/vim-vsnip-integ' },
    event = 'InsertEnter',
    cmd = { 'VsnipOpen' },
    config = function()
      vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'
    end,
  },
}
