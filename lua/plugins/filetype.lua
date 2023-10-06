return {
  ---- FileType Plugins ----------------------------------------------------------------------
  { 'chrisbra/csv.vim', ft = { 'csv', 'tsv' } },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
    ft = { 'html', 'js', 'ts' },
  },
  {
    'fuenor/JpFormat.vim',
    ft = { 'text', 'markdown' },
    config = function()
      vim.g.JpFormatCursorMovedI = 1
    end,
  },
  {
    'uga-rosa/ccc.nvim',
    config = function()
      require('ccc').setup {}
    end,
    cmd = { 'CccHighlighterEnable', 'CccHighlighterToggle' },
  },
}
