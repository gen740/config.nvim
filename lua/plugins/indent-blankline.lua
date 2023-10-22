return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    vim.api.nvim_set_hl(0, 'IblIndent', { bg = nil, fg = '#273344', blend = 0 })
    vim.api.nvim_set_hl(0, 'IblScope', { bg = nil, fg = '#6768a4', blend = 0 })
    require('ibl').setup {
      indent = {
        char = '▏',
      },
      scope = {
        enabled = false,
      },
    }
  end,
}
