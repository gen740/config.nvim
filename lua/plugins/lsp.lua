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

      -- require('lsp-inlayhints').setup {
      --   inlay_hints = {
      --     parameter_hints = {
      --       show = true,
      --       prefix = '← ',
      --       separator = ', ',
      --       remove_colon_start = false,
      --       remove_colon_end = true,
      --     },
      --     type_hints = {
      --       show = true,
      --       prefix = '∷ ',
      --       separator = ', ',
      --       remove_colon_start = true,
      --       remove_colon_end = false,
      --     },
      --     only_current_line = false,
      --     labels_separator = ' ',
      --     max_len_align = false,
      --     max_len_align_padding = 1,
      --     -- highlight group
      --     highlight = 'LspInlayHint',
      --   },
      --   enabled_at_startup = true,
      --   debug_mode = false,
      -- }
    end,
  },
  -- use {
  --   'j-hui/fidget.nvim',
  --   config = function()
  --     require('fidget').setup {}
  --   end,
  -- }
  -- {
  --   'jose-elias-alvarez/null-ls.nvim',
  --   config = function()
  --     local null_ls = require('null-ls')
  --     null_ls.setup {
  --       sources = {
  --         null_ls.builtins.formatting.stylua,
  --         null_ls.builtins.formatting.swift_format,
  --
  --         null_ls.builtins.formatting.isort,
  --         null_ls.builtins.formatting.black,
  --         -- null_ls.builtins.diagnostics.flake8,
  --
  --         null_ls.builtins.formatting.cmake_format,
  --         null_ls.builtins.formatting.latexindent,
  --       },
  --     }
  --   end,
  -- },

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
