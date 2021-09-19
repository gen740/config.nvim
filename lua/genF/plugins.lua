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
    use {'wbthomason/packer.nvim', opt = true}
    -- Treesitter ---------------------------------------------------------------------------------
    use {'nvim-treesitter/nvim-treesitter', config = myConf.treesitter}
    use {'neovim/nvim-lspconfig', config = myConf.nvim_lsp}
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        {
          "hrsh7th/cmp-buffer",
          event = 'InsertEnter'
        },
        {
          'hrsh7th/cmp-nvim-lsp',
          event = 'InsertEnter'
        },
        {
          'hrsh7th/cmp-path',
          event = 'InsertEnter'
        },
        {
          'hrsh7th/cmp-calc',
          event = 'InsertEnter'
        },
        {
          'ray-x/cmp-treesitter',
          event = 'InsertEnter'
        },
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

if not packer_exists then
    vim.cmd[[:PackerSync]]
end
