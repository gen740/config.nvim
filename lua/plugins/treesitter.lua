---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'c',
        'cpp',
        'python',
        'markdown',
        'markdown_inline',
        'latex',
        'lua',
        'rust',
        'vim',
        'julia',
        'typescript',
        'javascript',
        'diff',
        'go',
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(_, bufnr)
          local byte_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))
          if byte_size > 512 * 1000 then
            return true
          end
          return false
        end,
      },
      indent = { enable = false },
      matchup = {
        enable = true,
      },
    }
  end,
  dependencies = {
    {
      'andymass/vim-matchup',
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = 'popup' }
      end,
    },
    { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
  },
}
