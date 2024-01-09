---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  dependencies = {
    'andymass/vim-matchup',
  },
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = false },
      matchup = {
        enable = true,
      },
    }
    vim.g.matchup_matchparen_offscreen = { method = 'none' }
  end,
}
