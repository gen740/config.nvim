return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      local function load_config(name)
        require('genf.language_services.' .. name).lsp_config()
      end

      local config_dir = vim.fn.stdpath('config')
        .. '/lua/genf/language_services'
      local handle = vim.loop.fs_scandir(config_dir)
      while handle do
        local name, _ = vim.loop.fs_scandir_next(handle)
        if not name then
          break
        end
        local language_file = name:match('([^/\\]+)%.lua$')
        if language_file then
          pcall(load_config, language_file)
        end
      end
    end,
  },
  {
    'nvim-lua/lsp-status.nvim',
    config = function()
      local lsp_status = require('lsp-status')
      lsp_status.config {
        status_symbol = '',
        indicator_errors = '',
        indicator_warnings = '',
        indicator_info = '',
        indicator_hint = '',
        indicator_ok = '',
      }
      lsp_status.register_progress()
    end,
  },
}
