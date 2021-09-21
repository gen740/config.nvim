local myConf = require'genF.options'

-- Auto Packer Install
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end
  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )
  vim.fn.mkdir(directory, 'p')
  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))
  print(out)
  print("Downloading packer.nvim...")
  return
end

require('packer').startup{
  function(use)
    -- Packer -------------------------------------------------------------------------------------
    use {
      'wbthomason/packer.nvim',
      opt = true
    }

    -- None Regular -------------------------------------------------------------------------------
    use {
      'kana/vim-textobj-user',
      opt=true
    }
    use {
      'rbonvall/vim-textobj-latex',
      opt=true
    }

    -- Utilities ----------------------------------------------------------------------------------
    use {
      'windwp/nvim-ts-autotag',
      config = function () require'nvim-ts-autotag'.setup() end
    }
    -- use {'windwp/nvim-autopairs', config = function () require'nvim-autopairs'.setup() end}
    use {
      'jiangmiao/auto-pairs',
      ft = {'cpp', 'c', 'python', 'lua', 'javascript', 'tex', 'markdown'}
    }
    use {
      'skywind3000/asyncrun.vim',
      cmd = 'AsyncRun'
    }
    use {
      'kevinhwang91/nvim-bqf',
      requires = 'junegunn/fzf'
    }
    use {
      'neomake/neomake',
      cmd = {'Neomake', 'Neomake!'}
    }
    use {
      'easymotion/vim-easymotion',
    }
    use {
      'junegunn/vim-easy-align'
    }
    use {
      'b3nj5m1n/kommentary',
    }
    use {
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require("todo-comments").setup {}
      end
    }
    use {
      'lewis6991/gitsigns.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = myConf.gitsigns
    }
    use {
      'tpope/vim-surround',
      requires = 'tpope/vim-repeat'
    }
    use 'tpope/vim-fugitive'
    -- use 'kshenoy/vim-signature'
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = myConf.indent_blankline
    }
    use {
      'akinsho/nvim-toggleterm.lua',
      config = myConf.toggle_term
    }
    use 'majutsushi/tagbar'
    use 'mbbill/undotree'

    -- DashBoard ----------------------------------------------------------------------------------
    use {
      'glepnir/dashboard-nvim',
      config = myConf.dashboard
    }
    -- Treesitter ---------------------------------------------------------------------------------
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-refactor'
      },
      config = myConf.treesitter
    }
    -- Appearance ---------------------------------------------------------------------------------
    -- use {'morhetz/gruvbox'}
    use {'lifepillar/vim-gruvbox8'}
    use {
      'ellisonleao/gruvbox.nvim',
      requires = {"rktjmp/lush.nvim"},
      config = function() vim.cmd[[colo gruvbox]] end
    }
    use {
      'akinsho/nvim-bufferline.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = myConf.bufferline
    }
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = myConf.lualine
    }
    use {'honza/vim-snippets'}
    use {'SirVer/ultisnips'}
    -- File Operations ----------------------------------------------------------------------------
    use {'kyazdani42/nvim-tree.lua', config = myConf.nvim_tree}
    use {'kyazdani42/nvim-web-devicons'}
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = myConf.telescope
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    -- FileType Plugins ---------------------------------------------------------------------------
    use {'rhysd/vim-grammarous', ft = {'markdown', 'md', 'text'}}
    use {'chrisbra/csv.vim', ft = {'csv', 'tsv'}}
    use {'junegunn/goyo.vim', ft = {'text', 'markdown', 'md'}}
    use {'cespare/vim-toml', ft = 'toml'}
    use {'mattn/emmet-vim', ft = {'html', 'markdown', 'md'}}
    use {'vim-latex/vim-latex', ft = {'tex'}}
    use {'lervag/vimtex', ft = {'markdown', 'md', 'tex'}}
    use {'lvht/tagbar-markdown', ft = {'markdown', 'md'}}
    use {'plasticboy/vim-markdown', ft = {'markdown', 'md'}}
    use {'davidgranstrom/nvim-markdown-preview', ft = {'markdown', 'md'}}
    -- use {'rust-lang/rust.vim', ft = {'rust'}}

    -- LSP and Debugger ---------------------------------------------------------------------------
    use {'neovim/nvim-lspconfig', config = myConf.nvim_lsp}
    use {'mfussenegger/nvim-dap', config = myConf.nvim_dap}
    use {'rcarriga/nvim-dap-ui', config = myConf.dap_ui}

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function() require("trouble").setup { } end,
      cmd = "TroubleToggle"
    }

    use {
      "hrsh7th/nvim-cmp",
      requires = {
        {
          'onsails/lspkind-nvim',
          config = myConf.nvim_lspkind
        },
        {
          "hrsh7th/vim-vsnip",
          event = 'InsertEnter *'
        },
        {
          "hrsh7th/cmp-buffer",
          event = 'InsertEnter *'
        },
        {
          'hrsh7th/cmp-nvim-lsp',
          event = 'InsertEnter *'
        },
        {
          'hrsh7th/cmp-path',
          event = 'InsertEnter *'
        },
        {
          'hrsh7th/cmp-calc',
          event = 'InsertEnter *'
        },
        {
          'ray-x/cmp-treesitter',
          event = 'InsertEnter *'
        },
        {
          'quangnguyen30192/cmp-nvim-ultisnips',
          event = 'InsertEnter'
        },
        {
          'andersevenrud/compe-tmux',
          branch = 'cmp',
          opt = true,
          event = 'InsertEnter *'
        }
      },
      config = myConf.nvim_cmp,
    }
    use {
      'nvim-lua/lsp-status.nvim',
      config = myConf.lsp_status
    }
  end,

  config = {
    display = {
      open_fn = require'packer.util'.float,
    },
    profile = {
      enable = true,
      threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    }
  }
}

myConf.others()
