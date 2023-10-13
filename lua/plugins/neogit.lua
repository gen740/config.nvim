return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'sindrets/diffview.nvim',
    'ibhagwan/fzf-lua',
  },
  cmd = 'Neogit',
  config = function()
    require('neogit').setup {}
    local config = require('neogit.config').values
    config.mappings.status['<tab>'] = nil
    config.mappings.status['l'] = 'Toggle'
  end,
}
