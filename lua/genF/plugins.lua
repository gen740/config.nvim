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
    use {'wbthomason/packer.nvim', opt = true}
    use {
      'nvim-treesitter/nvim-treesitter',
      config = function()
	require'nvim-treesitter.configs'.setup {
	  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	  highlight = {
	    enable = true              -- false will disable the whole extension
	  },
	  indent = {
	    enable = true,              -- false will disable the whole extension
	  },
	}
      end
    }
    use {
      'EdenEast/nightfox.nvim',
      config = function()
	vim.cmd [[colo nightfox]]
      end,
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

-- vim:sw=2:
