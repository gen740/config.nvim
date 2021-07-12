return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Utilities
  use 'skywind3000/asyncrun.vim'
  use 'easymotion/vim-easymotion'
  use 'vim-jp/vimdoc-ja'
  use 'junegunn/vim-easy-align'
  use 'tpope/vim-commentary'
  -- use 'airblade/vim-gitgutter'
  use {'lewis6991/gitsigns.nvim',
      requires = {
          'nvim-lua/plenary.nvim'
      },
  }
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use '9mm/vim-closer'
  use 'MattesGroeger/vim-bookmarks'
  use 'kshenoy/vim-signature'
  use 'tpope/vim-fugitive'
  use 'yggdroot/indentline'
  use 'akinsho/nvim-toggleterm.lua'
  -- use 'sotte/presenting.vim'

  -- use 'kana/vim-textobj-user'
  -- use 'rbonvall/vim-textobj-latex'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'

  -- Appearance
  use {'morhetz/gruvbox', setup = function() vim.cmd 'colo gruvbox' end}
  use {'lifepillar/vim-gruvbox8'} -- GruvBox 8
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'honza/vim-snippets'
  use 'SirVer/ultisnips'

  -- Fern
  -- use {'lambdalisue/fern.vim', as = 'Fern'}
  -- use {'lambdalisue/nerdfont.vim', as = 'FernNodeFont', disable = false} -- Fern Nerd Font
  -- use {'lambdalisue/fern-renderer-nerdfont.vim', disable = false}
  -- use {'LumaKernel/fern-mapping-fzf.vim', disable = true}
  -- use {'lambdalisue/fern-git-status.vim', disable = false}
  -- use {'lambdalisue/fern-mapping-git.vim', disable = false}
  -- use 'lambdalisue/fern-bookmark.vim'
  -- use {'lambdalisue/fern-hijack.vim', disable = false}
  use 'kyazdani42/nvim-tree.lua'

  -- use 'ryanoasis/vim-devicons'
  -- use 'yuki-yano/fzf-preview.vim'
  use 'junegunn/fzf.vim'
  -- use {'junegunn/fzf', run = './install --all', disable = false} -- Installed Via HomeBrew
  use 'kyazdani42/nvim-web-devicons'
  use 'tom-anders/telescope-vim-bookmarks.nvim'
  use {'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      disable = false}
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', disable = false}
  -- use {'fannheyward/telescope-coc.nvim', disable = false}
  use {'majutsushi/tagbar', disable = false}
  use {'mbbill/undotree', opt = true}
  use {'godlygeek/tabular', opt = true}
  use {'puremourning/vimspector', opt = true}
  use {'lilydjwg/colorizer', opt = true, disable = true}

  -- FileType Plugins
  use {'chrisbra/csv.vim', ft = {'csv', 'tsv'}}
  use {'junegunn/goyo.vim', ft = {'txt', 'markdown', 'md'}}
  use {'previm/previm', ft = {'markdown', 'md'}}
  use {'cespare/vim-toml', ft = 'toml'}
  use 'plasticboy/vim-markdown'
  use {'lvht/tagbar-markdown', ft = {'markdown', 'md'}}
  use {'mattn/emmet-vim', ft = {'html', 'markdown', 'md'}}
  use {'vim-latex/vim-latex', ft = {'tex', 'markdown'}}
  use {'lervag/vimtex', ft = {'markdown', 'md', 'tex'}}

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'hrsh7th/nvim-compe'}
  -- use 'neoclide/coc.nvim'
end)

