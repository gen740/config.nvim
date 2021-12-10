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
    --[[ use {
      'kana/vim-textobj-user',
      opt=true
    }
    use {
      'rbonvall/vim-textobj-latex',
      opt=true
    } ]]

    -- Utilities ----------------------------------------------------------------------------------
    use {
      'RRethy/vim-hexokinase',
      run = 'make hexokinase',
      config = function ()
        vim.g.Hexokinase_highlighters = {'virtual'}
      end,
      cmd = {'HexokinaseToggle'}
    }
    use {
      'windwp/nvim-ts-autotag',
      config = function () require'nvim-ts-autotag'.setup() end,
      ft = {'html'}
    }
    use {
      'jiangmiao/auto-pairs',
      -- config = myConf.auto_pair,
      ft = {
        'cpp', 'c', 'python', 'lua', 'javascript', 'typescript', 'json',
        'rust', 'vim',
      }
    }
    use {
      'skywind3000/asyncrun.vim',
      cmd = {'AsyncRun', 'Say'}
    }
    use {
      'kevinhwang91/nvim-bqf',
      requires = 'junegunn/fzf',
      config = myConf.bqf,
      -- cmd = {'copen'}
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
    --[[ use {
      'b3nj5m1n/kommentary',
    } ]]
    use {
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    }
    use {
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = myConf.todo_comment
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
    use {
      'tpope/vim-fugitive',
      cmd = 'Git'
    }
    use 'kshenoy/vim-signature'
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = myConf.indent_blankline
    }
    use {
      'akinsho/nvim-toggleterm.lua',
      config = myConf.toggle_term
    }
    use {
      'majutsushi/tagbar',
      cmd = 'TagbarToggle'
    }
    use {
      'mbbill/undotree',
      cmd = 'UndotreeToggle'
    }
    use {
      'andymass/vim-matchup'
    }
    use {
      'rcarriga/nvim-notify'
    }

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
    use {'nvim-treesitter/playground'}

    -- Appearance ---------------------------------------------------------------------------------
    use {
      'ellisonleao/gruvbox.nvim',
      requires = {"rktjmp/lush.nvim"},
      -- config = function() vim.cmd[[colo gruvbox]] end
    }
    use {'marko-cerovac/material.nvim'}
    use {'kyazdani42/blue-moon'}
    use {'mhartington/oceanic-next'}
    use {'sainnhe/everforest'}
    use {'EdenEast/nightfox.nvim'}
    use {'morhetz/gruvbox'}
    use 'kvrohit/substrata.nvim'
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
    use {
      'honza/vim-snippets',
      event = 'VimEnter *'
    }
    use {
      'SirVer/ultisnips',
      event = 'VimEnter *'
    }
    -- File Operations ----------------------------------------------------------------------------
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = myConf.nvim_tree,
      cmd = 'NvimTreeToggle'
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = myConf.telescope,
      cmd = {'Telescope'}
    }
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      requires = 'junegunn/fzf',
      run = 'make'
    }
    -- FileType Plugins ---------------------------------------------------------------------------
    use {'rhysd/vim-grammarous', ft = {'markdown', 'md', 'text'}}
    use {'chrisbra/csv.vim', ft = {'csv', 'tsv'}}
    use {'junegunn/goyo.vim', ft = {'text', 'markdown', 'md'}}
    use {'mattn/emmet-vim', ft = {'html', 'markdown', 'md'}}
    -- use {'tomlion/vim-solidity', ft = {'solidity'}}
    -- use {'vim-latex/vim-latex', ft = {'tex'}}
    use {'lervag/vimtex', ft = {'markdown', 'md', 'tex'}}
    use {'lvht/tagbar-markdown', ft = {'markdown', 'md'}}
    use {'plasticboy/vim-markdown', ft = {'markdown', 'md'}}
    use {'davidgranstrom/nvim-markdown-preview', ft = {'markdown', 'md'}}
    use {'fuenor/JpFormat.vim', ft = {'text'}}
    -- use {'rust-lang/rust.vim', ft = {'rust'}}
    use 'fladson/vim-kitty'
    use {
      'KeitaNakamura/tex-conceal.vim'
    }
    use {
      'chikamichi/mediawiki.vim'
    }

    -- LSP and Debugger ---------------------------------------------------------------------------
    use {'neovim/nvim-lspconfig', config = myConf.nvim_lsp}
    -- use {'github/copilot.vim'}
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
        --[[ {
          "hrsh7th/vim-vsnip",
          event = 'InsertEnter *'
        }, ]]
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
        --[[ {
          'andersevenrud/compe-tmux',
          branch = 'cmp',
          opt = true,
          event = 'InsertEnter *'
        } ]]
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
      threshold = 100 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    }
  }
}

vim.cmd[[colo nightfox]]
myConf.others()
