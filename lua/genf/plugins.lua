---@diagnostic disable-next-line
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input('Download Packer? (y for yes)') ~= 'y' then
    return
  end
  local directory = string.format('%s/site/pack/packer/opt/', vim.fn.stdpath('data'))
  vim.fn.mkdir(directory, 'p')
  local out = vim.fn.system(
    string.format(
      'git clone %s %s',
      'https://github.com/wbthomason/packer.nvim',
      directory .. '/packer.nvim'
    )
  )
  print(out)
  print('Downloading packer.nvim...')
  return
end

--@param name string
local function config(name)
  return require('genf.configs.' .. name).setup
end

require('packer').startup {
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    ---- Utilities -----------------------------------------------------------------------------
    use { 'cohama/lexima.vim', config = config('lexima') }
    use {
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
    }
    use { 'machakann/vim-sandwich', keys = { 'sa', 'sd', 'sr' } }
    use { 'numToStr/Comment.nvim', config = config('comment'), keys = 'gc' }
    use { 'mbbill/undotree', cmd = 'UndotreeToggle' }
    use { 'tpope/vim-fugitive' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'lewis6991/gitsigns.nvim', config = config('gitsigns') }
    use { 'SirVer/ultisnips', requires = { 'honza/vim-snippets' }, config = config('ultisnips') }
    use { 'folke/noice.nvim', requires = { 'MunifTanjim/nui.nvim' }, config = config('noice') }
    use { 'rcarriga/nvim-notify', config = config('notify') }
    -- use { 'wakatime/vim-wakatime' }
    -- use { 'xiyaowong/virtcolumn.nvim' }

    ---- Treesitter ----------------------------------------------------------------------------
    use {
      'nvim-treesitter/nvim-treesitter',
      config = config('treesitter'),
      requires = {
        { 'andymass/vim-matchup' },
        { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
        { 'JoosepAlviste/nvim-ts-context-commentstring' },
      },
    }

    ---- Appearance ----------------------------------------------------------------------------
    use {
      'EdenEast/nightfox.nvim',
      config = function()
        vim.cmd('colo nordfox')
      end,
    }

    ---- File Operations -----------------------------------------------------------------------
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = config('nvim_tree'),
      cmd = { 'NvimTreeToggle' },
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {
          'nvim-lua/popup.nvim',
        },
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          requires = 'junegunn/fzf',
          run = 'make',
        },
      },
      config = config('telescope'),
      cmd = 'Telescope',
    }

    ---- FileType Plugins ----------------------------------------------------------------------
    use { 'rhysd/vim-grammarous', ft = { 'markdown', 'markdown', 'text' } }
    use { 'chrisbra/csv.vim', ft = { 'csv', 'tsv' } }
    use {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup {}
      end,
      ft = { 'html', 'js', 'ts' },
    }
    use {
      'fuenor/JpFormat.vim',
      ft = { 'text', 'markdown' },
      config = function()
        vim.g.JpFormatCursorMovedI = 1
      end,
    }
    -- use { 'chikamichi/mediawiki.vim', ft = { 'mediawikix' } }

    ---- LSP and Debugger ----------------------------------------------------------------------
    use {
      'neovim/nvim-lspconfig',
      requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'lvimuser/lsp-inlayhints.nvim',
      },
      config = require('genf.configs.lsp').setup,
      -- config('lsp'),
    }
    use { 'jose-elias-alvarez/null-ls.nvim', config = config('null-ls') }
    use {
      'rcarriga/nvim-dap-ui',
      requires = {
        'mfussenegger/nvim-dap',
      },
      config = config('dap'),
    }
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        { 'onsails/lspkind-nvim' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lsp-signature-help' },
        { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-calc' },
        -- { 'hrsh7th/cmp-cmdline' },
        { 'quangnguyen30192/cmp-nvim-ultisnips' },
        { 'neovim/nvim-lspconfig' },
      },
      config = config('nvim_cmp'),
    }
    use {
      'uga-rosa/ccc.nvim',
      config = function()
        require('ccc').setup {}
      end,
      cmd = { 'CccHighlighterEnable', 'CccHighlighterToggle' },
    }
  end,
}
