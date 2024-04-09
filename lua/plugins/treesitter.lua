---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = false,
      sync_install = true,
      highlight = {
        enable = true,
        disable = function(_, bufnr)
          return vim.api.nvim_buf_line_count(bufnr) > 20000
        end,
      },
    }
  end,
}
