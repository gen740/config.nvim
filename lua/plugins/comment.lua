return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup {}
  end,
  keys = { { 'gc', mode = 'n' }, { 'gc', mode = 'v' } },
}
