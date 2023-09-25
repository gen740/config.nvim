return {
  {
    'hrsh7th/vim-vsnip',
    dependencies = { 'honza/vim-snippets' },
    config = function()
      vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'
    end,
  },
  {
    'hrsh7th/vim-vsnip-integ',
  },
}
