local myConf = require'genF.options'
-- file type plugin
-- vim.g.Imap_UsePlaceHolders = 0
-- vim.g.Imap_StickyPlaceHolders = 0
-- vim.g.suppress_latex_suite = 1
-- vim.cmd 'packadd! matchit'

vim.opt.runtimepath:append('~/.vim/JpFormat.vim')
-- vim.opt.formatexpr=[[jpfmt#formatexpr()]]
vim.opt.formatexpr=[[jpvim#formatexpr()]]
vim.g.jpvim_remove_youon = 1
vim.g.JpFormatCursorMovedI = 1
vim.g.jpfmt_paragraph_regexp = '-^[「'
vim.cmd [[au BufRead *.txt JpSetAutoFormat]]
vim.cmd [[au BufRead *.md JpSetAutoFormat]]

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
    use {'wbthomason/packer.nvim', opt = true}
    -- None Regular -------------------------------------------------------------------------------
    -- use {'sotte/presenting.vim', opt=true}
    -- use {'kana/vim-textobj-user', opt=true}
    -- use {'rbonvall/vim-textobj-latex', opt=true}
    -- use {'godlygeek/tabular', opt = true}
    -- use {'puremourning/vimspector', opt = true}
    -- use {'lilydjwg/colorizer', opt = true, disable = true}
    -- use {'yggdroot/indentline'}
    -- Utilities ----------------------------------------------------------------------------------
    -- use {'jiangmiao/auto-pairs', ft = {'cpp', 'c', 'python', 'lua', 'javascript', 'tex'}}
    use {'skywind3000/asyncrun.vim', cmd = 'AsyncRun'}
    use {'easymotion/vim-easymotion', event = 'VimEnter'}
    use {'junegunn/vim-easy-align', event = 'VimEnter'}
    use {'tpope/vim-commentary', event = 'VimEnter'}
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = myConf.gitsigns}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-surround'}
    use {'kshenoy/vim-signature'}
    use {'tpope/vim-fugitive'}
    use {'lukas-reineke/indent-blankline.nvim'}
    use {'akinsho/nvim-toggleterm.lua', config = myConf.toggle_term}
    -- DashBoard ----------------------------------------------------------------------------------
    use {'glepnir/dashboard-nvim', config = myConf.dashboard}
    -- Treesitter ---------------------------------------------------------------------------------
    use {'nvim-treesitter/nvim-treesitter', config = myConf.treesitter}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'nvim-treesitter/nvim-treesitter-refactor'}
    -- Appearance ---------------------------------------------------------------------------------
    use {'morhetz/gruvbox', setup = function() vim.cmd 'colo gruvbox' end}
    -- use {'lifepillar/vim-gruvbox8', opt = true, setup = function() vim.cmd 'colo gruvbox8' end}
    use {'akinsho/nvim-bufferline.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = myConf.bufferline}
    use {'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = myConf.lualine}
    use {'honza/vim-snippets'}
    use {'SirVer/ultisnips'}
    -- File Operations ----------------------------------------------------------------------------
    use {'kyazdani42/nvim-tree.lua', config = myConf.nvim_tree}
    use 'kyazdani42/nvim-web-devicons'
    use {'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = myConf.telescope}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', disable = false}
    use {'majutsushi/tagbar', disable = false}
    use {'mbbill/undotree'}
    -- FileType Plugins ---------------------------------------------------------------------------
    use {'chrisbra/csv.vim', ft = {'csv', 'tsv'}}
    use {'junegunn/goyo.vim', ft = {'text', 'markdown', 'md'}}
    use {'previm/previm', ft = {'markdown', 'md'}}
    use {'cespare/vim-toml', ft = 'toml'}
    use 'plasticboy/vim-markdown'
    use {'mattn/emmet-vim', ft = {'html', 'markdown', 'md'}}
    use {'vim-latex/vim-latex', ft = {'tex'}}
    use {'lervag/vimtex', ft = {'markdown', 'md', 'tex'}}
    use {'lvht/tagbar-markdown', ft = {'markdown', 'md'}}
    use {'rhysd/vim-grammarous', ft = {'markdown', 'md', 'text'}}
    -- LSP ----------------------------------------------------------------------------------------
    use {'neovim/nvim-lspconfig', config = myConf.nvim_lsp}
    -- use {'hrsh7th/nvim-compe', event = 'InsertEnter', config = myConf.nvim_compe}
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-buffer",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-calc',
        'ray-x/cmp-treesitter',
        'quangnguyen30192/cmp-nvim-ultisnips',
        {
          'andersevenrud/compe-tmux',
          branch = 'cmp',
          opt = true,
        }
      },
      config = myConf.nvim_cmp
    }
    use {'onsails/lspkind-nvim', config = myConf.nvim_lspkind}
    use {'nvim-lua/lsp-status.nvim', config = myConf.lsp_status}
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
