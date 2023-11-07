return {
  'hrsh7th/nvim-insx',
  config = function()
    require('insx.preset.standard').setup()
    local insx = require('insx')
  end,
}
