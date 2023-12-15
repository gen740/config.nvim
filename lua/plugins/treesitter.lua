---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = false },
    }
  end,
}
