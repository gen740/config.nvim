return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'lvimuser/lsp-inlayhints.nvim',
    },
    config = function()
      local function load_config(name)
        require('genf.language_services.' .. name).lsp_config()
      end

      local languages = {
        'cmake', --
        'cpp',
        'go',
        'javascript',
        'typescript',
        'typescriptreact',
        'json',
        'lua',
        'python',
        'rust',
        'swift',
        'tex',
        'toml',
        'yaml',
      }

      for _, lang in ipairs(languages) do
        load_config(lang)
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
