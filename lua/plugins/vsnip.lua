return {
  {
    'hrsh7th/vim-vsnip',
    dependencies = { 'honza/vim-snippets', 'hrsh7th/vim-vsnip-integ' },
    event = 'InsertEnter',
    config = function()
      vim.g.vsnip_snippet_dir = '~/.config/nvim/snippets'
    end,
  },
}
