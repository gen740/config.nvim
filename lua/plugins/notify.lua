return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      background_colour = '#000000',
      render = 'minimal',
      stages = 'static',
      minimum_width = 10,
      timeout = 3000,
    }
  end,
}
