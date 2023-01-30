return {
  ---- Utilities -----------------------------------------------------------------------------
  {
    'junegunn/vim-easy-align',
    config = function()
      vim.cmd([[
        let g:easy_align_delimiters = {
            \ '\': {
            \     'pattern': '\\$',
            \    },
            \ }
        ]])
    end,
  },
  { 'machakann/vim-sandwich', keys = { 'sa', 'sd', 'sr' } },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {}
    end,
    keys = 'gc',
  },
  { 'mbbill/undotree', cmd = 'UndotreeToggle' },
  { 'tpope/vim-fugitive' },
  { 'nvim-lua/plenary.nvim' },
  -- use { 'xiyaowong/virtcolumn.nvim' }

  ---- Appearance ----------------------------------------------------------------------------
  {
    'EdenEast/nightfox.nvim',
    config = function()
      vim.cmd('colo nordfox')
    end,
  },

  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup {
        color_icons = true,
        default = true,
      }
    end,
  },

  ---- FileType Plugins ----------------------------------------------------------------------
  { 'rhysd/vim-grammarous', ft = { 'markdown', 'markdown', 'text' } },
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
  { 'chikamichi/mediawiki.vim', ft = { 'mediawiki' } },

  {
    'uga-rosa/ccc.nvim',
    config = function()
      require('ccc').setup {}
    end,
    cmd = { 'CccHighlighterEnable', 'CccHighlighterToggle' },
  },
}
