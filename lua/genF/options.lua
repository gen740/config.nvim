-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                           « Plugin settings »                                   │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

-- Easy Motion
local others = function ()
  vim.g.EasyMotion_keys = 'aoeidtnpyfgcrl;qjkxbmwvzuhs'  -- This Option is For Dvorak User
  vim.g.EasyMotion_do_mapping = 0
  vim.g.EasyMotion_use_migemo = 1
  -- Indentline
  vim.g.indentLine_color_gui = '#555555'
  vim.cmd [[autocmd FileType tex let g:indentLine_color_gui = "#dddddd"]]
  vim.cmd [[autocmd BufNewFile,BufRead *.tex hi Statement guifg=#dddddd]]
  vim.g.indentLine_fileTypeExclude = {'dashboard', 'markdown'}
  -- vim.g.indentLine_char = '┊'
  -- vim.g.indentLine_char = '│'
  -- vim.g.indentLine_char = '⎸'
  vim.g.indentLine_char = '▏'
  vim.g.indentLine_conceallevel = 1
  vim.g.indentLine_concealcursor=""
  -- markdown
  vim.g.vim_markdown_fenced_languages = {'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini'}
  vim.g.vim_markdown_math = 1
  -- Tex
  vim.g.Tex_SmartKeyBS = 0
  vim.g.Tex_SmartKeyQuote = 0
  vim.g.Tex_SmartKeyDot = 0
  vim.g.Tex_CompileRule_pdf = 'lualatex $* > /dev/null'
  vim.g.Tex_CompileRule_dvi = 'lualatex $* > /dev/null'
  -- Ultisnips
  vim.g.UltiSnipsExpandTrigger="<tab>"
  vim.g.UltiSnipsJumpForwardTrigger="<c-j>"
  vim.g.UltiSnipsJumpBackwardTrigger="<c-k>"
  vim.g.UltiSnipsEditSplit="vertical"
end

--- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                              « Treesitter »                                     │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local treesitter_init = function()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true              -- false will disable the whole extension
    },
    indent = {
      enable = false,              -- false will disable the whole extension
      disable = { "c", "cpp", "python"},
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
      highlight_definitions = { enable = false },
      highlight_current_scope = { enable = false },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
  }
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « Telescope Configurations »                              │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local telescope_init = function()
  local actions = require('telescope.actions')
  local custom_action = {
    action = function() vim.cmd [[:loadview]] end
  }
  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          ["<cr>"] = actions.select_default + actions.center + custom_action,
        },
        n = {
          ["<esc>"] = actions.close,
          ["<cr>"] = actions.select_default,
        },
      },
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
      file_ignore_patterns = {
        "node_modules/*",
        "legacy/*",
        "third_parties/*",
        "overrides/*",
        "__pycache__",
        ".github",
        ".DS_Store",
        ".gitignore"
      },
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      -- borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      color_devicons = true,
      use_less = true,
    }
  }
  -- require('telescope').load_extension('fzf')
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « Nvim Tree Configurations »                              │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local nvim_tree_init = function ()
  vim.g.nvim_tree_gitignore = 1
  vim.g.nvim_tree_quit_on_open = 1
  vim.g.nvim_tree_follow = 1
  vim.g.nvim_tree_indent_markers = 0
  vim.g.nvim_tree_hide_dotfiles = 1
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_highlight_opened_files = 1
  vim.g.nvim_tree_root_folder_modifier = ':~'
  vim.g.nvim_tree_auto_resize = 1
  vim.g.nvim_tree_auto_open = 0
  vim.g.nvim_tree_disable_netrw = 0
  vim.g.nvim_tree_hijack_netrw = 0
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
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « Git signs Configurations »                              │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local gitsigns_init = function()
  require('gitsigns').setup {
      signs = {
          add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
          change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
          delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
          changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
      numhl = true,
      linehl = false,
      keymaps = {
          -- Default keymap options
          noremap = true,
          buffer = true,
          ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
          ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},
          ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
          ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
          ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
          ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
          ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
          ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
          -- Text objects
          ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
          ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
      },
      watch_index = {
          interval = 1000,
          follow_files = true
      },
      -- current_line_blame = false,
      -- current_line_blame_opts.delay = 1000,
      -- current_line_blame_opts.position = 'eol',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      word_diff = false,
      -- use_decoration_api = true,
      -- diff_opts.internal = true,  -- If luajit is present
  }
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                           « LSP Configurations »                                │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local nvim_lsp_init = function()
  local nvim_lsp = require('lspconfig')
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  -- Keymaps
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  local servers = {'vimls',
                   'pyright',
                   'dockerls',
                   'tsserver',
                   'html',
                   'cssls',
                   -- 'flow',
                   'rust_analyzer',
                   -- 'denols',
                   -- 'sourcekit',
                   'clangd',
                   'jsonls',
                   'texlab',
                   'bashls',
                   'cmake',}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
  require'lspconfig'.zeta_note.setup{
    cmd = {'/Users/fujimotogen/.local/bin/zeta-note-macos'},
    on_attach = on_attach
  }
  local system_name
  if vim.fn.has("mac") == 1 then
    system_name = "macOS"
  elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
  elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
  else
    print("Unsupported system for sumneko")
  end
  local sumneko_root_path = '/Users/fujimotogen/.local/tools/lua-language-server'
  local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
  require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = '/usr/local/bin/lua',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {'vim'},
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  }
  vim.cmd([[ autocmd ColorScheme * :lua require('vim.lsp.diagnostic')._define_default_signs_and_highlights() ]])
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                       « nivm compe Configurations »                             │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local nvim_compe_init = function()
  require'compe'.setup {
      enabled = true;
      autocomplete = true;
      debug = false;
      min_length = 1;
      preselect = 'enable';
      throttle_time = 80;
      source_timeout = 200;
      resolve_timeout = 800;
      incomplete_delay = 400;
      max_abbr_width = 100;
      max_kind_width = 100;
      max_menu_width = 100;
      documentation = {
          -- border = { '╭', '─' ,'╮', '│', '╯', '─', '╰', '│' },
          border = { '┌', '─' ,'┐', '│', '┘', '─', '└', '│' },
          -- winhighlight = "NormalFloat:CompeDocumentation, FloatBorder:CompeDocumentationBorder",
          max_width = 120,
          min_width = 60,
          max_height = math.floor(vim.o.lines * 0.3),
          min_height = 1,
      };
      source = {
          ultisnips = true;
          path = true;
          buffer = true;
          calc = true;
          nvim_lsp = true;
          -- nvim_lua = true;
          -- vsnip = true;
      };
  }
end


local nvim_cmp_init = function()
  local cmp = require 'cmp'
  local WIDE_HEIGHT = 40
  cmp.setup {
    completion = {
      autocomplete = true,
      -- completeopt = 'menu,menuone,noinsert',
    },
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
    },
    documentation = {
      border = { '╭', '─' ,'╮', '│', '╯', '─', '╰', '│' },
      winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
      maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
      maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'treesitter' },
      { name = 'ultisnips' },
      { name = 'calc' },
    },
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
        -- set a name for each source
        -- vim_item.menu = ({
        --   buffer = "[Buffer]",
        --   nvim_lsp = "[LSP]",
        --   nvim_lua = "[Lua]",
        --   latex_symbols = "[Latex]",
        -- })[entry.source.name]
        return vim_item
      end,
    },
  }
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                             « Nvim LSP Kind »                                   │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local nvim_lspkind_init = function()
  require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
      Calc = "aoe"
    },
  })
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                          « Status and Tab line »                                │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local lsp_status_init = function()
  local lsp_status = require('lsp-status') -- TODO
  lsp_status.register_progress()
end

function Word_count()
  return [[ : ]] .. vim.fn.wordcount()['chars']
end

local lualine_init = function()
  require('lualine').setup{
    options = {
      theme = 'onedark',
      icons_enabled = 1,
      padding = 1,
      left_padding = 1,
      right_padding =1,
      upper = false,
      lower = false,
      format = nil,
      section_separators = {'', ''},
      component_separators = {'', ''},
    },
    sections = {
      lualine_a = {{'mode', lower = true}},
      lualine_b = {'branch'},
      lualine_c = {{require'lsp-status'.status}, {Word_count}},
      lualine_x = {'filetype', 'encoding'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    extensions = {'quickfix', 'nvim-tree'},
  }
end

local bufferline_init = function()
  require('bufferline').setup {
    options = {
      numbers = 'none',
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      indicator_icon = '▎',
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      name_formatter = function(buf)
        if buf.name:match('%.md') then
          return vim.fn.fnamemodify(buf.name, ':t:r')
        end
      end,
      max_name_length = 15,
      max_prefix_length = 10,
      tab_size = 6,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return "" .. icon .. count
      end,
      -- diagnostics_indicator = function(count)
      --   return ""..count..""
      -- end,
      offsets = {{filetype = "NvimTree", text = " File Explorer", text_align = 'center',}},
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = false,
      persist_buffer_sort = false,
      separator_style = 'slant',
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      sort_by = 'id',
    },
    highlights = {
      fill = {
        guibg = '#333333'
      },
      buffer_selected = {
        guifg = 'orange'
      },
      separator_selected = {
        guifg = '#333333',
      },
      separator_visible = {
        guifg = '#333333'
      },
      separator = {
        guifg = '#333333',
      },
    },
  }
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                              « Toggle Term »                                    │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local toggle_term_init = function()
  require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    size  = function(term)
              if term.direction == "horizontal" then
                return 15
              elseif term.direction == "vertical" then
                return vim.o.columns * 0.3
              end
            end,
    open_mapping = [[<m-w>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = 'horizontal', -- 'vertical' | 'horizontal' | 'window' | 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = 'single', -- | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      -- width = <value>,
      -- height = <value>,
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      }
    }
  }
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                        « DashBoard Configurations »                             │
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

local dashboard_init = function()
  vim.g.dashboard_default_executive = 'telescope'
  -- let s:dashboard_shortcut_icon['last_session'] = ' '
  -- let s:dashboard_shortcut_icon['find_history'] = ' '
  -- let s:dashboard_shortcut_icon['find_file'] = ' '
  -- let s:dashboard_shortcut_icon['new_file'] = ' '
  -- let s:dashboard_shortcut_icon['change_colorscheme'] = ' '
  -- let s:dashboard_shortcut_icon['find_word'] = ' '
  -- let s:dashboard_shortcut_icon['book_marks'] = ' '

  vim.g.dashboard_custom_section={
    buffer_list        = {
      description      = {[[ Config Files                                              ]]},
      command          = [[:cd ~/.config/nvim | Telescope find_files]]
    },
    -- last_session       = {
    --   description      = {[[ Open last session                                         ]]},
    --   command          = [[:SessionLoad]]
    -- },
    find_history       = {
      description      = {[[ Recently opened files                                     ]]},
      command          = [[:DashboardFindHistory]]
    },
    find_file          = {
      description      = {[[ Find file                                                 ]]},
      command          = [[:DashboardFindFile]]
    },
    new_file           = {
      description      = {[[ New file                                                  ]]},
      command          = [[:DashboardNewFile]]
    },
    change_colorscheme = {
      description      = {[[ Change colorscheme                                        ]]},
      command          = [[:DashboardChangeColorscheme]]
    },
    find_word          = {
      description      = {[[ Find word                                                 ]]},
      command          = [[:DashboardFindWord]]
    },
    book_marks         = {
      description      = {[[ Jump to bookmarks                                         ]]},
      command          = [[:DashboardJumpMark]]
    },
  }
  vim.g.dashboard_custom_header = {""}

  -- vim.g.dashboard_custom_header = {
  -- [[                               ommmmms                    +mmdmd`                                   ]],
  -- [[                               `hNNNNy:+ssso/..../osso+/-.hNNNN+                                    ]],
  -- [[                             ./oydmNNNhdds+::---::/ohdddNNNNNNo`                                    ]],
  -- [[                          `/yysydhNNNNmdmmmmmmmmmmmmmmmddmmmmdddho-                                 ]],
  -- [[            `-.       ```..../hmmddmmdmmmmmmmmmmmmmmmmmmmmmmmmmddyys-`        ``                    ]],
  -- [[           ommNd:  `/s+...:ohdmmmmmmdmmmmmmmmmmddmmmmmmmmmmmmmmmmds:..`..   :ydydy`                 ]],
  -- [[           dNNNNN+/hh+++shddddddddddddddddddddddydddddddddddddddddddy+:/oo-oNNNmmy`                 ]],
  -- [[           /mNNNNNmmddddddddddddddddddddddddddddhydddddddhddddddysdddddhhdmNNNNNN+                  ]],
  -- [[            `:hNmNNNdddddddddddddhdddddddddddddddyhdddddddhhddhsyhdddddddNNNNNNms::/-               ]],
  -- [[            .yh/hdmddddddddddddddyddddddddddddddddsdddddddddyysyddddddddddmdhNhso/:/s-              ]],
  -- [[           .s+.:dddddddddhddddddyhddddddddddddddddhoyyyyyyyyysssssssyyhdddddhhsos:  +/              ]],
  -- [[          ....:ydddddddddyddddddyddddddddddddddddddo+yyhhhhssyyyhdddddddddddddossh/ /+    `         ]],
  -- [[        `o-.:shddddddddddydddddhyddddddddddddddddddhyddddhsshddyhdddddddddddydhoshh::+  .+s-        ]],
  -- [[ ``.`  `so+yhdddddddddddyhdddddhhdddddddddddddddddddyNdhhsyhddddyhdddhdddddhyydhsshs::`/+:s/        ]],
  -- [[/mhmmh/ohhddddhhddddddddyddddddyhddddddddddddddddhhdymNdsyhdddddhyddhyddmdhssosysosh/:+:``o+        ]],
  -- [[.dmNNNNNNmydhhyhhhhhdddhyddddddyhdhdddddddddddddhhshhhNNmdhddddddhyhhshddNdsoohys+/o//.  `o+        ]],
  -- [[ .shhhmmNNhhhshhhyhhhhhhyhhhhhhyhhddhhhhhhhhhhhhhhshhyNNNNmhhhhhhhyhhshhhddooohhhh/+o--` `s/        ]],
  -- [[   ``.yyhhhhyyhhhshhhhhyshhhhhhyhhmmhhhhhhhhhhhhhhshhsmmmmmmhhhhhhhyhshhhhhss/hhyo/////+//s.        ]],
  -- [[     .yhhhhhshhhhshhhhhyshhhhhhyhhmNhdhhhhhhhhhhhhshh+hmmNNNNmdhhhhshshhhhhhs+sso+oo+o:.++-         ]],
  -- [[     /hhhhhhshhhhshhhhhyshhhhhhyhhdNhhhhhhhhhhhhhhshhydNNNNNNNNNdhhhyshhhhhhosssyosh+o+``//`        ]],
  -- [[     ohhhhhhshhhhyhhhhhhshhhhhhyhhhdhhhhhhhhhhhhhhsyhydNNNNNNNNNNNdhsshhhhhhh+yhoshho/o: `o-        ]],
  -- [[     shdhhhhshhhhshhhhhhshhhhhhyyhhhhhhhhhhhhhhhhhyyhydmNNNNNNNNNNNNdohhhhhhh/+ssshho+o+`.o-        ]],
  -- [[     yhNdhhhshhhhshhhhhhshhhhhhhyhhhhhddddddddddddyydodNmdy/oooshmmNNyhhhhyhh::+shhhos+o:+/         ]],
  -- [[     yhNdhhhshhhhhyhhhhhyhhhhhhhyhhhddddddddddddddyhdos+:`  `.o-:/+mNyhhhyyhy::osyhyoyooo:          ]],
  -- [[     yhmdhhhshhhhhshhhhhhsddddddyhdyddddddddddddddhhdo/+/ `..-/.`sysdhdddyhhs/osoosooysoo-          ]],
  -- [[     shhhhhhshhhhhyhhddddyhddddddydydmmmmmmmmmmmmmydmsmm-.:+::/:`:mdhddddyddymmNNyhyyhoo++          ]],
  -- [[     +hhhhhhyyhhhhhyddddddydddmmmhdhdmmmmmmmmmmmmmymddNN//oo:-oo-/NNhmddhddhddhdNhhhhhoo/o.         ]],
  -- [[     .yhhhhhhsddddhhhdddddhdmmmmmmhmhmmmmmmmmmmmmmymhNNNd+hhyhy+:dNNdmmdhmmhhhhhNdhhhhoo-s-         ]],
  -- [[      ohhhhhhyhdddhdhdmmmmmhmmmmmmddddmmmmmmmmmmmdhmhNNNNNmshddymNNdmmmhmmdmyhshNdhhhy+o.o:         ]],
  -- [[      -yhhhhhhsdmmdhmhmmmmmmhmmmmmmhmhmmmmmmmmmmmymhmNNNNNNNNmmNNNNhmmddmmdmyhhhNyhhh+++`+/         ]],
  -- [[       +hhhhhhyymmmdhdhmmmmmddmmmmmmhmhmmmmmmmmmddmhNNNNNNNNNNNNNNdmmddmmdmhhhhNd+yhy-o+`++         ]],
  -- [[       `shhhhhhyymmmdddhmmmmmdmmmmmmmhdhmmNNNNNNmNNNNNNNNNNNNNNNNNdmddmmdmyhhdNh//yy:.s/ /+         ]],
  -- [[        .yhhhhhhyymmmmddhmmmmmmmmmmNNNmNNNNNNNNNmNNNNNNNNNNNNNNNNmmmmNmmNmmNNmo::/yo`-y: /+         ]],
  -- [[         :yhhhhhhhyhmmmddhmmmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNddmmy/:-:os` /s. ++         ]],
  -- [[          /yyyhhhhhyyhdddmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNd//+/::-:/o. `o+  +/         ]],
  -- [[           :yysyhhhhhhyodNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNm/:-:::--:/.  -s- `o:         ]],
  -- [[            -syyssyhhhhyomNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNm/::-:-.--.`   /o` .s-         ]],
  -- [[             `/yy//+syhhyomNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNh/:::.``..`    `o/  -s.         ]],
  -- [[               -os+::/+ooo+ymNNNNNNNNNNNNNNNNNNNmNNNNNNNNNNNNNNNNNho:::::` ``      -o.  :o`         ]],
  -- [[                 -oo/::-::::+sdNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNmy+::-`...          /:  `++          ]],
  -- [[                   ./+/:--:::::/sdmNNNNNNNNNNNNNNNNNNNNNNNNNmho/:--`              .o.  .o/          ]],
  -- [[                     `.---...----:/oydmNNNNNNNNNNNNNNNNNNNmhy/-.``                //   -s-          ]],
  -- [[                              ````-:://++hdmmNNNNNNNNNNmhyhhy:-++/`              .o.   /o`          ]],
  -- [[                                  :hdNmh/yhhyhhhdddddhhhhhhhhsmmmNd.             //    --           ]],
  -- [[                                  dNNmmmdyyhhhhhhhhhhhhhhhhymNNNNdN:             -`                 ]],
  -- [[     `-:-``oy+.                   mNmmNNNNdyyhhyhhhhhhhyyhymNNNNNmd`                   .:/-   ````  ]],
  -- [[    /dNNNmhNNNNy:`                oNNNNNNNNhmNNNhyhhhhmNNymNNNNNNd-                 `:ymNNh:+yhdmdy-]],
  -- [[   .NNNNNNNNNNNNNh/`              `hNNNNNNNNNNNNNdyyhNNNNNNNNNNNd:                 -hNNNmmmNNNNNNNN+]],
  -- [[   -NNNNNNNNNNNNNNNoo+-`         -oymmNNNNNNNNNNNNyhNNNNNNNNNNNmmmy/--.```     `-:+NNNNNNNNNNNNNNNm:]],
  -- [[   -NNNNNNNNNNNNNNmmNNNh:`  .:/+yNNNNmhNNNNNNNNNNNmNNNNNNNdNNNNNNNNNNNNmdhs:./ymNNhNNNNNNNNNNNNNNNs ]],
  -- [[   `dNNNNNNNNNNNNNmmNNNNNyosmNNNNNNNNNNNNNNNmNNNNNNNNNNNNdmNNNNNNNNNNNNNNNNhdNNNNNhNNNNNNNNNNNNNNd. ]],
  -- [[    +NNNNNNNNNNNNNNdmNNNNdddNNNNNNNNNNNNNNNNdhyyy/sydNNNNNNNNNNNNNNNNNNNNNmddNNNNdmNNNNNNNNNNNNNN/  ]],
  -- [[     hNNNNNNNNNNNNNdhmNNNmmdNNNNNNNNNNNNms/-..-/.```./+oshmNNNNNNNNNNNNNNNddNNNNddNNNNNNNNNNNNNNy`  ]],
  -- [[     .dNNNNNNNNNNNNhNNNNNNdhNNNNNNNNNNh/.`.+ymNs``-``+yo/..:+hNNNNNNNNNNNddNNNNdmNNNNNNNNNNNNNNh.   ]]}

  -- vim.g.dashboard_custom_footer = {}
  vim.cmd [[autocmd FileType dashboard highlight DashboardHeader guifg=#9999bb]]
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────────────────────────┼

-- Export
return {
  others = others,
  treesitter = treesitter_init,
  nvim_compe = nvim_compe_init,
  telescope = telescope_init,
  dashboard = dashboard_init,
  lualine = lualine_init,
  bufferline = bufferline_init,
  nvim_tree = nvim_tree_init,
  gitsigns = gitsigns_init,
  nvim_lsp = nvim_lsp_init,
  lsp_status = lsp_status_init,
  toggle_term = toggle_term_init,
  nvim_cmp = nvim_cmp_init,
  nvim_lspkind = nvim_lspkind_init,
}

-- vim:set foldmethod=marker:
-- vim:set foldlevel=0:
