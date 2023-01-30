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
      highlight = { enable = true },
      indent = { enable = false },
      -- refactor = {
      --   highlight_definitions = { enable = true },
      --   highlight_current_scope = { enable = false },
      -- },
      matchup = {
        enable = true,
      },
      -- autotag = {
      --   enable = true,
      -- },
      context_commentstring = {
        enable = true,
      },
      disable = function(lang, bufnr)
        local byte_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr))
        if byte_size > 512 * 1000 then
          return true
        end
        local ok = true
        ok = pcall(function()
          vim.treesitter.get_parser(bufnr, lang):parse()
        end) and ok
        ok = pcall(function()
          vim.treesitter.get_query(lang, 'highlights')
        end) and ok
        if not ok then
          return true
        end
        return false
      end,
    }
  end,
  dependencies = {
    { 'andymass/vim-matchup' },
    { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
  },
}
