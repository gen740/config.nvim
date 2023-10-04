return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    vim.g.matchup_matchparen_offscreen = {}
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
        'go',
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(lang, bufnr)
          -- if lang == 'yaml' then
          --   return true
          -- end
          if lang == 'gitcommit' then
            return true
          end
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
  },
}
