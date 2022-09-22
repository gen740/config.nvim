local function setup()
  vim.g.UltiSnipsExpandTrigger = '<tab>'
  vim.g.UltiSnipsJumpForwardTrigger = '<c-e>'
  vim.g.UltiSnipsJumpBackwardTrigger = '<c-k>'
  vim.g.UltiSnipsEditSplit = 'vertical'
  vim.g.matchup_matchparen_offscreen = { method = 'popup' }
end

return {
  setup = setup,
}
