return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    vim.g.matchup_matchparen_offscreen = {}
    require('nvim-treesitter.configs').setup {
      autotag = {
        enable = true,
      },
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
        'go',
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(lang, bufnr)
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
      context_commentstring = {
        enable = true,
      },
    }
  end,
  dependencies = {
    { 'andymass/vim-matchup' },
    { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup {}
      end,
      ft = { 'html', 'js', 'ts' },
    },
  },
}
