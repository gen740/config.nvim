return {
  'SirVer/ultisnips',
  dependencies = { 'honza/vim-snippets' },
  config = function()
    vim.g.UltiSnipsExpandTrigger = '<tab>'
    vim.g.UltiSnipsJumpForwardTrigger = '<c-e>'
    vim.g.UltiSnipsJumpBackwardTrigger = '<c-k>'
    vim.g.UltiSnipsEditSplit = 'vertical'
  end,
}
