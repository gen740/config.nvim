-- Auto Packer Install Start
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]]) --@ignore
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

    --------------------------------------------------------------------------------------------
    ---- Utilities -----------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------
    use {
      'cohama/lexima.vim',
      config = function()
        vim.g.lexima_enable_basic_rules = 1
        vim.g.lexima_enable_newline_rules = 1
        vim.g.lexima_enable_endwise_rules = 1
        vim.api.nvim_call_function('lexima#set_default_rules', {})
      end,
    }
    use { 'junegunn/vim-easy-align' }
    use { 'machakann/vim-sandwich', keys = { 'sa', 'sd', 'sr' } }
    use {
      'uga-rosa/ccc.nvim',
      config = function()
        local ccc = require('ccc')
        ccc.setup {}
      end,
    }
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup {}
      end,
      keys = 'gc',
    }
    use { 'mbbill/undotree', cmd = 'UndotreeToggle' }
    use { 'tpope/vim-fugitive' }
    use { 'nvim-lua/plenary.nvim' }
    -- use({
    --   'lukas-reineke/indent-blankline.nvim',
    --   config = require('genf.configs.indent_blankline').setup,
    -- })
    use { 'lewis6991/gitsigns.nvim', config = require('genf.configs.gitsigns').setup }
    use {
      'SirVer/ultisnips',
      requires = { 'honza/vim-snippets' },
      config = config('ultisnips'),
    }
    use { 'wakatime/vim-wakatime' }
    -- use({
    --   'folke/noice.nvim',
    --   event = 'VimEnter',
    --   config = function()
    --     require('noice').setup()
    --   end,
    --   requires = {
    --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --     { 'MunifTanjim/nui.nvim' },
    --   },
    -- })
    use {
      'rcarriga/nvim-notify',
      config = function()
        require('notify').setup {
          background_colour = '#000000',
          render = 'minimal',
          stages = 'static',
          minimum_width = 10,
          timeout = 3000,
        }
      end,
    }
    use { 'lewis6991/impatient.nvim' }
    use { 'xiyaowong/virtcolumn.nvim' }

    --------------------------------------------------------------------------------------------
    ---- Treesitter ----------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------
    use {
      'nvim-treesitter/nvim-treesitter',
      config = config('treesitter'),
      requires = {
        'andymass/vim-matchup',
      },
    }
    use {
      'nvim-treesitter/playground',
      cmd = 'TSPlaygroundToggle',
    }

    --------------------------------------------------------------------------------------------
    ---- Appearance ----------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------
    ---- Color Scheme
    use {
      'EdenEast/nightfox.nvim',
      config = function()
        vim.cmd('colo nordfox')
      end,
    }

    --------------------------------------------------------------------------------------------
    ---- File Operations -----------------------------------------------------------------------
    --------------------------------------------------------------------------------------------
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

    --------------------------------------------------------------------------------------------
    ---- FileType Plugins ----------------------------------------------------------------------
    --------------------------------------------------------------------------------------------
    use { 'rhysd/vim-grammarous', ft = { 'markdown', 'markdown', 'text' } }
    use { 'chrisbra/csv.vim', ft = { 'csv', 'tsv' } }
    use { 'mattn/emmet-vim', ft = { 'html', 'markdown', 'markdown' } }
    use { 'qnighy/satysfi.vim' }
    use {
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = function()
        require('nvim-treesitter.configs').setup {
          context_commentstring = {
            enable = true,
          },
        }
      end,
    }
    use {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup {}
      end,
      ft = { 'html', 'js', 'ts' },
    }
    -- use({ 'lervag/vimtex', ft = { 'markdown', 'tex' } })
    use {
      'fuenor/JpFormat.vim',
      ft = { 'text', 'markdown' },
      config = function()
        vim.g.JpFormatCursorMovedI = 1
      end,
    }
    use { 'chikamichi/mediawiki.vim', ft = { 'mediawikix' } }
    -- use { 'KeitaNakamura/tex-conceal.vim', config = function() vim.g.tex_conceal_frac = 1 end, ft = { 'latex' } }
    -- use { 'rbonvall/vim-textobj-latex', requires = { 'kana/vim-textobj-user' }, ft = { 'latex' } }

    --------------------------------------------------------------------------------------------
    ---- LSP and Debugger ----------------------------------------------------------------------
    --------------------------------------------------------------------------------------------
    use {
      'neovim/nvim-lspconfig',
      requires = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
      },
      config = function()
        require('genf.configs.lsp').mason()
        require('genf.configs.lsp').nvim_lsp()
      end,
    }
    use {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        local null_ls = require('null-ls')
        null_ls.setup {
          sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.perltidy,
            null_ls.builtins.formatting.shfmt,
            null_ls.builtins.formatting.markdownlint,
            null_ls.builtins.diagnostics.markdownlint,
            null_ls.builtins.formatting.latexindent,
          },
        }
      end,
    }
    use { 'lvimuser/lsp-inlayhints.nvim', config = require('genf.configs.lsp').inlay_hints }
    use { 'mfussenegger/nvim-dap', config = require('genf.configs.dap').nvim_dap }
    use { 'mfussenegger/nvim-dap-ui', config = require('genf.configs.dap').dap_ui }
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
        { 'hrsh7th/cmp-cmdline' },
        { 'quangnguyen30192/cmp-nvim-ultisnips' },
        { 'neovim/nvim-lspconfig' },
      },
      config = require('genf.configs.nvim_cmp').nvim_cmp,
    }
    use {
      'nvim-lua/lsp-status.nvim',
      -- config = require('genf.configs.statusline').setup,
      config = require('genf.configs.lsp_status').setup,
    }

    --------------------------------------------------------------------------------------------
    -- OBSOLETE --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------------------
    -- use { 'tversteeg/registers.nvim' }
    -- use { 'chentoast/marks.nvim', config = require('genf.configs.marks').marks }
  end,
}
