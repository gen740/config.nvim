return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      dependencies = 'junegunn/fzf',
      build = 'make',
    },
  },
  cmd = 'Telescope',
  config = function()
    local actions = require('telescope.actions')
    local previewers = require('telescope.previewers')
    local new_maker = function(filepath, bufnr, opts)
      opts = opts or {}
      filepath = vim.fn.expand(filepath)
      ---@diagnostic disable-next-line
      vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then
          return
        end
        if stat.size > 200000 then
          return
        else
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
      end)
    end

    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<cr>'] = actions.select_default,
            ['<esc>'] = actions.close,
          },
          n = {
            ['<esc>'] = actions.close,
            ['<cr>'] = actions.select_default,
          },
        },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--trim',
        },
        prompt_prefix = '  ',
        layout_config = {
          prompt_position = 'top',
          width = 0.8,
        },
        selection_caret = ' ▶ ',
        entry_prefix = '   ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        file_ignore_patterns = {
          'node_modules/',
          'third_parties/',
          '__pycache__/',
          '.cache/',
          '.git/',
          '.DS_Store',
        },
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        buffer_previewer_maker = new_maker,
      },
      pickers = {
        find_files = {
          find_command = { 'fd', '-H', '--type', 'f', '--strip-cwd-prefix' },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },
      },
    }
    require('telescope').load_extension('fzf')
  end,
}
