return {

  ---- Utilities -----------------------------------------------------------------------------
  {
    'machakann/vim-sandwich',
    keys = {
      { 'sa', mode = 'n' },
      { 'sd', mode = 'n' },
      { 'sr', mode = 'n' },
      { 'sa', mode = 'v' },
      { 'sd', mode = 'v' },
      { 'sr', mode = 'v' },
    },
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {}
    end,
    keys = { { 'gc', mode = 'n' }, { 'gc', mode = 'v' } },
  },
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },

  ---- Appearance ----------------------------------------------------------------------------
  {
    'EdenEast/nightfox.nvim',
    config = function()
      vim.cmd('colo nordfox')
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {
        color_icons = true,
        default = true,
      }
    end,
  },
  {
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
  },
}
