---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      auto_install = true,
      ensure_installed = {
        'bash',
        'c',
        'cmake',
        'cpp',
        'diff',
        'dockerfile',
        'gitcommit',
        'go',
        'javascript',
        'json',
        'latex',
        'lua',
        'markdown',
        'python',
        'rust',
        'swift',
        'toml',
        'typescript',
        'vimdoc',
        'yaml',
      },
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
