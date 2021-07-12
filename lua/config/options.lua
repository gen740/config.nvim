-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                           « Plugin settings »                                   │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- Vim Bookmark
vim.g.bookmark_no_default_key_mappings = 0

-- Easy Motion
vim.g.EasyMotion_keys = 'aoeidtnpyfgcrl;qjkxbmwvzuhs'
vim.g.EasyMotion_do_mapping = 0
vim.g.EasyMotion_use_migemo = 1

-- Previm
vim.g.previm_open_cmd = 'open -a Safari'

-- GitGutter
vim.g.gitgutter_map_keys = 0
vim.g.gitgutter_realtime = 1
vim.g.gitgutter_enabled = 0

-- Indentline
vim.g.indentLine_color_gui = '#555555'
vim.cmd [[autocmd FileType tex let g:indentLine_color_gui = "#dddddd"]]
vim.cmd [[autocmd BufNewFile,BufRead *.tex hi Statement guifg=#dddddd]]

vim.g.indentLine_char = '┊'
-- vim.g.indentLine_char = '│'
vim.g.indentLine_conceallevel = 1
vim.g.indentLine_concealcursor=""

-- Air Line
vim.g['airline#extensions#branch#enabled'] = 1
vim.cmd [[autocmd FileType tex let g:indentLine_enabled=0]]
vim.g['airline#extensions#bufferline#enabled'] = 1
vim.g['airline#extensions#default#layout'] = {{ 'a', 'b', 'c' }, { 'x', 'y', 'z'}}
vim.g['airline#extensions#fugitiveline#enabled'] = 1
vim.g['airline#extensions#fzf#enabled'] = 1
vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
vim.g['airline#extensions#tabline#close_symbol'] = 'X'
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#formatter'] ='default'
-- vim.g['airline#extensions#tabline#left_alt_sep'] = ''
-- vim.g['airline#extensions#tabline#left_sep'] = ' '
-- vim.g['airline#extensions#tabline#right_alt_sep'] = ''
-- vim.g['airline#extensions#tabline#right_sep'] = ' '
vim.g['airline#extensions#tabline#left_alt_sep'] = ''
vim.g['airline#extensions#tabline#left_sep'] = ' '
vim.g['airline#extensions#tabline#right_alt_sep'] = ''
vim.g['airline#extensions#tabline#right_sep'] = ' '
vim.g['airline#extensions#tabline#show_close_button'] = 1
vim.g['airline#extensions#wordcount#enabled'] = 0
vim.g.airline_detect_modified=1
-- vim.g.airline_left_alt_sep = ''
-- vim.g.airline_left_sep = ''
-- vim.g.airline_right_alt_sep = ''
-- vim.g.airline_right_sep = ''
vim.g.airline_left_alt_sep = ''
vim.g.airline_left_sep = ''
vim.g.airline_right_alt_sep = ''
vim.g.airline_right_sep = ''
vim.g.airline_stl_path_style = 'short'
vim.g.airline_theme = 'minimalist' -- 'gruvbox'  ubaryd, understated violet solalized

-- Fern
vim.g['fern#renderer'] = 'nerdfont'
vim.cmd [[autocmd Filetype fern setlocal nonu norelativenumber]]
vim.cmd [[let g:fzf_layout = {'up':'~90%', 'window' : { 'width': 0.8, 'height': 0.8, 'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' }}]]
vim.cmd [[
function! Init_fern() abort
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
endfunction
augroup my-fern
  autocmd! *
  autocmd FileType fern call Init_fern()
augroup END ]]

-- vimspector
vim.g.vimspector_enable_mappings = 'HUMAN'

-- colorizer
vim.g.colorizer_nomap=1

-- markdown
vim.g.vim_markdown_fenced_languages = {'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'}
vim.g.vim_markdown_math = 1

-- Tex
vim.g.Tex_SmartKeyBS = 0
vim.g.Tex_SmartKeyQuote = 0
vim.g.Tex_SmartKeyDot = 0
vim.g.Tex_CompileRule_pdf = 'lualatex $* > /dev/null'
vim.g.Tex_CompileRule_dvi = 'lualatex $* > /dev/null'

-- Coc
vim.cmd [[
function! Show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction ]]

vim.cmd [[
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
augroup end
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
]]

--- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                              « Treesitter »                                     │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true              -- false will disable the whole extension
  },
  indent = {
    enable = false,              -- false will disable the whole extension
  -- disable = { "c", "cpp", "python"},
  },
  incremental_selection = {
    enable = true              -- false will disable the whole extension
  },
  textobjects = {
    select = {
    enable = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      -- Or you can define your own textobjects like this
      ["iF"] = {
        python = "(function_definition) @function",
        cpp = "(function_definition) @function",
        c = "(function_definition) @function",
        java = "(method_declaration) @function",
        },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>sp"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>sP"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  refactor = {
    -- highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = true },
    -- smart_rename = {
     -- enable = false,
     -- keymaps = {
       -- smart_rename = "grr",
     -- },
   -- },
  },
}

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « Telescope Configurations »                              │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
            },
        prompt_prefix = '  ',
        layout_config = {
            prompt_position = 'top',
            width = 0.8,
            },
        selection_caret = " ▶ ",
        entry_prefix = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        border = {},
        -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        -- borderchars = {
        --     prompt = {"─", "│", " ", "│", '┌', '┬', "│", "│"},
        --     results = {"─", "│", "─", "│", "├", "┤", "┴", "└"},
        --     preview = { '─', '│', '─', ' ', '─', '┐', '┘', '─'},
        -- },
        color_devicons = true,
        use_less = true,
    }
}
require('telescope').load_extension('fzf')
-- require('telescope').load_extension('coc')
require('telescope').load_extension('vim_bookmarks')

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « Nvim Tree Configurations »                              │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_auto_resize = 1
vim.g.nvim_tree_disable_netrw = 1
vim.g.nvim_tree_hijack_netrw = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_disable_window_picker = 0
vim.g.nvim_tree_hijack_cursor = 1
vim.g.nvim_tree_icon_padding = ' '
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_window_picker_exclude = {
      ['filetype'] = {
        'packer',
        'qf'
    },
      ['buftype'] = {
        'terminal'
    }
    }
vim.g.nvim_tree_special_files = { ['README.md'] = 1, ['Makefile'] = 1, ['MAKEFILE'] = 1 }
vim.g.nvim_tree_show_icons = {
    ['git'] = 1,
    ['folders'] = 1,
    ['files'] = 1,
    ['folder_arrows'] = 1,
    }

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
      },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
      },
      lsp = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    }

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                      « Toggle Term Configurations »                             │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  -- size = 20,
  -- | function(term)
  --   if term.direction == "horizontal" then
  --     return 15
  --   elseif term.direction == "vertical" then
  --     return vim.o.columns * 0.4
  --   end
  -- end,
  -- open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  -- shade_filetypes = {},
  -- shade_filetypes = { "none", "fzf" },
  -- shade_terminals = true,
  -- shading_factor = '2', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  -- start_in_insert = true,
  -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
  -- persist_size = true,
  direction = 'float', -- 'vertical' | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  float_opts = {
    border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' |
    -- width = <value>,
    -- height = <value>,
    -- winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
--}}}

-- require('gitsigns').setup {
--   signs = {
--     add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
--     change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
--     delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
--     topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
--     changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
--   },
--   numhl = false,
--   linehl = false,
--   keymaps = {
--     -- Default keymap options
--     noremap = true,
--     buffer = true,

--     ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
--     ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

--     ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
--     ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
--     ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
--     ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
--     ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
--     ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
--     ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
--     ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

--     -- Text objects
--     ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
--     ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
--   },
--   watch_index = {
--     interval = 1000,
--     follow_files = true
--   },
--   current_line_blame = false,
--   current_line_blame_delay = 1000,
--   current_line_blame_position = 'eol',
--   sign_priority = 6,
--   update_debounce = 100,
--   status_formatter = nil, -- Use default
--   word_diff = false,
--   use_decoration_api = true,
--   use_internal_diff = true,  -- If luajit is present
--
-- }}}

-- LSP
-- require'lspconfig'.pyright.setup{}
-- require'lspconfig'.clangd.setup{}

--local nvim_lsp = require('lspconfig')
---- Use an on_attach function to only map the following keys
---- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
--  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--  --Enable completion triggered by <c-x><c-o>
--  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
--  -- Mappings.
--  local opts = { noremap=true, silent=true }
--  -- See `:help vim.lsp.*` for documentation on any of the below functions
--  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
--  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
--  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

--end

---- Use a loop to conveniently call 'setup' on multiple servers and
---- map buffer local keybindings when the language server attaches
--local servers = { "pyright", "rust_analyzer", "tsserver" }
--for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup {
--    on_attach = on_attach,
--    flags = {
--      debounce_text_changes = 150,
--    }
--  }

--end

--vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]]) 

--require'compe'.setup {
--  enabled = true;
--  autocomplete = true;
--  debug = false;
--  min_length = 1;
--  preselect = 'enable';
--  throttle_time = 80;
--  source_timeout = 200;
--  resolve_timeout = 800;
--  incomplete_delay = 400;
--  max_abbr_width = 100;
--  max_kind_width = 100;
--  max_menu_width = 100;
--  documentation = {
--    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
--    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
--    max_width = 120,
--    min_width = 60,
--    max_height = math.floor(vim.o.lines * 0.3),
--    min_height = 1,
--  };

--  source = {
--    path = true;
--    buffer = true;
--    calc = true;
--    nvim_lsp = true;
--    nvim_lua = true;
--    vsnip = true;
--    ultisnips = true;
--    luasnip = true;
--  };
--}

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
