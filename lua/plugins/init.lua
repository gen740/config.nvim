--------------------------------------------------------------------------------
---                           Utility Plugins                                ---
--------------------------------------------------------------------------------

return {
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
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = function()
      vim.g.undotree_ShortIndicators = 1
    end,
  },
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
}
