local function setup()
  vim.g.UltiSnipsExpandTrigger = '<tab>'
  vim.g.UltiSnipsJumpForwardTrigger = '<c-e>'
  vim.g.UltiSnipsJumpBackwardTrigger = '<c-k>'
  vim.g.UltiSnipsEditSplit = 'vertical'
end

return {
  setup = setup,
}
