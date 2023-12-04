---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = false,
      highlight = false,
      indent = { enable = false },
    }
  end,
}
