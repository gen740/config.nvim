return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'lvimuser/lsp-inlayhints.nvim',
    },
    config = function()
      require('mason').setup {}
      require('mason-lspconfig').setup {}

      local function load_config(name)
        require('genf.language_services.' .. name).lsp_config()
      end

      local languages = {
        'cmake', --
        'cpp',
        'go',
        'json',
        'lua',
        'python',
        'rust',
        'tex',
        'toml',
        'yaml',
      }

      for _, lang in ipairs(languages) do
        load_config(lang)
      end

      require('lsp-inlayhints').setup {
        inlay_hints = {
          parameter_hints = {
            show = true,
            prefix = '← ',
            separator = ', ',
            remove_colon_start = false,
            remove_colon_end = true,
          },
          type_hints = {
            show = true,
            prefix = '∷ ',
            separator = ', ',
            remove_colon_start = true,
            remove_colon_end = false,
          },
          only_current_line = false,
          labels_separator = ' ',
          max_len_align = false,
          max_len_align_padding = 1,
          -- highlight group
          highlight = 'LspInlayHint',
        },
        enabled_at_startup = true,
        debug_mode = false,
      }
    end,
    -- config('lsp'),
  },
  -- use {
  --   'j-hui/fidget.nvim',
  --   config = function()
  --     require('fidget').setup {}
  --   end,
  -- }
  {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
      require('lspsaga').setup {
        lightbulb = {
          enable = false,
          enable_in_insert = true,
          sign = true,
          sign_priority = 40,
          virtual_text = true,
        },
        symbol_in_winbar = {
          enable = false,
          separator = ' ',
          hide_keyword = true,
          show_file = true,
          folder_level = 2,
          respect_root = false,
          color_mode = true,
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,

          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.black,
          null_ls.builtins.diagnostics.flake8,

          null_ls.builtins.formatting.cmake_format,
          null_ls.builtins.formatting.latexindent,
        },
      }
    end,
  },
}
