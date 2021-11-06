M = {}

-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                    « Treesitter »                           │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.treesitter()
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
      additional_vim_regex_highlighting = { "latex", "tex"},
    },
    indent = {
      enable = false,              -- false will disable the whole extension
    },
    incremental_selection = {
      enable = false,              -- false will disable the whole extension
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
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
    matchup = {
      enable = true,
    },
  }
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{             « Telescope Configurations »                    │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.telescope()
  local actions = require('telescope.actions')
  local custom_action = {
    action = function() vim.cmd [[:loadview]] end
  }
  require('telescope').setup{
    defaults = {
      mappings = {
        i = {
          ["<cr>"] = actions.select_default + actions.center + custom_action,
          ["<esc>"] = actions.close,
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
        prompt_position = 'top';
        width = 0.8;
      };
      selection_caret = " ▶ ";
      entry_prefix = "   ";
      initial_mode = "insert";
      selection_strategy = "reset";
      sorting_strategy = "ascending";
      layout_strategy = "horizontal";
      border = {};
      file_ignore_patterns = {
        "node_modules/*";
        "legacy/*";
        "third_parties/*";
        "overrides/*";
        "__pycache__";
        ".github";
        ".DS_Store";
        ".gitignore";
      };
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' };
      -- borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' };
      color_devicons = true;
      use_less = true;
    };
    extensions = {
      fzf = {
        fuzzy = true;                    -- false will only do exact matching
        override_generic_sorter = true;  -- override the generic sorter
        override_file_sorter = true;     -- override the file sorter
        case_mode = "smart_case";        -- or "ignore_case" or "respect_case"
      }
    }
  }
  require('telescope').load_extension('fzf')
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{             « Nvim Tree Configurations »                    │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.nvim_tree()
  require'nvim-tree'.setup {
    disable_netrw       = false,
    hijack_netrw        = false,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    hijack_cursor       = true,
    update_cwd          = false,
    lsp_diagnostics     = true,
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },

    view = {
      width = 30,
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {}
      }
    }
  }
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{             « Git signs Configurations »                    │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.gitsigns()
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
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<cr>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<cr>',
      -- text objects
      ['o ih'] = ':<c-u>lua require"gitsigns.actions".select_hunk()<cr>',
      ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    word_diff = false,
  }
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                  « Indent Blank Line »                      │
-- ┼─────────────────────────────────────────────────────────────────┼
function M.indent_blankline()
  vim.cmd [[autocmd FileType * highlight IndentBlanklineIndent1 guifg=#665c54 blend=nocombine]]
  vim.cmd [[autocmd FileType * highlight IndentBlanklineIndent2 guifg=#3c3836 blend=nocombine]]

  vim.cmd [[autocmd FileType * highlight IndentBlanklineBlue guifg=#458588 blend=nocombine]]
  vim.cmd [[autocmd FileType * highlight IndentBlanklinePurple guifg=#b16286 blend=nocombine]]
  vim.cmd [[autocmd FileType * highlight IndentBlanklineAqua guifg=#a381ff blend=nocombine]]
  vim.cmd [[autocmd FileType * highlight IndentBlanklineRed guifg=#719cd6 blend=nocombine]]
  vim.cmd [[autocmd FileType * highlight IndentBlanklineOrange guifg=#fe8019 blend=nocombine]]
  vim.cmd [[autocmd FileType * highlight IndentBlanklineGreen guifg=#98971a blend=nocombine]]
  vim.cmd [[autocmd FileType * highlight IndentBlanklineGray guifg=#928374 blend=nocombine]]

  vim.g.indentLine_fileTypeExclude = {'dashboard', 'markdown'}
  vim.g.indent_blankline_use_treesitter = true
  vim.g.indent_blankline_show_current_context = true
  vim.g.indent_blankline_context_patterns = {
    '^if',
    'argument_list',
    'array',
    'arrow_function',
    'block',
    'switch_statement',
    'case_statement',
    'class',
    'dictionary',
    'dictionnary',
    'element',
    'enum_body',
    'enum_item',
    'environment',
    'except',
    'for',
    'func_literal',
    'function',
    'method',
    'object',
    'table',
    'try',
    'while',
    'with',
  }
  vim.g.indent_blankline_context_highlight_list = {
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
  }
  require("indent_blankline").setup {
    buftype_exclude = {"dashboard", "markdown"},
    space_char_blankline = " ",
    char = '▏', -- '▏', '┊', '│', '⎸'
    char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
    }
  }
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                 « LSP Configurations »                      │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.nvim_lsp()
  local nvim_lsp = require('lspconfig')
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")
  -- Keymaps
  local on_attach = function(bufnr)
    local border = { '╭', '─' ,'╮', '│', '╯', '─', '╰', '│' }
    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
    for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
    vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})
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
    buf_set_keymap('n', '<space>td', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  local flags = {
    debounce_text_changes = 100,
  }
  local servers = {'vimls',
                   'pyright',
                   'dockerls',
                   'tsserver',
                   'solang',
                   'html',
                   'cssls',
                   -- 'flow',
                   'rust_analyzer',
                   -- 'denols',
                   -- 'sourcekit',
                   'clangd', -- brew install llvm
                   'taplo', -- cargo install taplo-lsp
                   'jsonls',
                   'texlab',
                   'gopls',
                   'bashls',
                   'cmake',}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      flags = flags,
    }
  end
  require'lspconfig'.zeta_note.setup{
    cmd = {'/Users/fujimotogen/.local/bin/zeta-note-macos'},
    on_attach = on_attach
  }
  local sumneko_root_path = '/Users/fujimotogen/.local/tools/lua-language-server'
  local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"
  require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = '/usr/local/bin/lua',
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  }
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{              « nivm cmp Configurations »                    │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.nvim_cmp()
  local cmp = require'cmp'
  local WIDE_HEIGHT = 40
  cmp.setup {
    --[[ completion = {
      autocomplete = true,
      completeopt = 'menu,menuone,noinsert',
    }, ]]
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
      --[[ ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }, ]]
    },
    documentation = {
      border = { '╭', '─' ,'╮', '│', '╯', '─', '╰', '│' },
      winhighlight = 'NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder',
      maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
      maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer', keyword_length = 5 },
      { name = 'path' },
      { name = 'treesitter' },
      { name = 'ultisnips' },
      { name = 'calc' },
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
        })[entry.source.name]
        return vim_item
      end,
    }
  }
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{              « nivm cmp Configurations »                    │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.auto_pair()
  require("nvim-autopairs.completion.cmp").setup({
    map_cr = true,
    map_complete = true,
    auto_select = true,
    insert = false,
    map_char = {
      all = '(',
      tex = '{'
    }
  })
  local Rule = require('nvim-autopairs.rule')
  local npairs = require('nvim-autopairs')
  local cond = require('nvim-autopairs.conds')
  -- print(vim.inspect(cond))
  -- npairs.add_rule(Rule("$$","$$","tex"))
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                   « Nvim LSP Kind »                         │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.nvim_lspkind()
  require('lspkind').init({
    with_text = true,
    preset = 'default',
  })
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                « Status and Tab line »                      │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.lsp_status()
  local lsp_status = require('lsp-status')
  lsp_status.register_progress()
  lsp_status.config {
    status_symbol = '';
    current_function = true,
  }
end

function Word_count()
  return [[ : ]] .. vim.fn.wordcount()['chars']
end

function M.lualine()
  require('lualine').setup{
    options = {
      theme = 'nightfox',
      icons_enabled = 1,
      padding = 1,
      left_padding = 1,
      right_padding =1,
      upper = false,
      lower = false,
      format = nil,
      section_separators = {'', ''},
      component_separators = {'│', '│'},
    },
    sections = {
      lualine_a = {{'mode', lower = true}},
      lualine_b = {'branch'},
      -- lualine_c = {{require'lsp-status'.status()}},
      lualine_c = {"os.date('%a')", 'data', "require'lsp-status'.status()"},
      lualine_x = {'filetype', 'encoding'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    extensions = {'quickfix', 'nvim-tree'},
  }
end

function M.bufferline()
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
      --[[ max_name_length = 15,
      max_prefix_length = 10, ]]
      tab_size = 6,
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return "" .. icon .. count
      end,
      offsets = {{filetype = "NvimTree", text = " File Explorer", text_align = 'center',}},
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = false,
      persist_buffer_sort = false,
      separator_style = 'thin',
      enforce_regular_tabs = false,
      always_show_bufferline = true,
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
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                « Nvim Dap (Debugger) »                      │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.nvim_dap()
  local dap = require('dap')
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/opt/llvm/bin/lldb-vscode', -- adjust as needed
    name = "lldb"
  }
  dap.adapters.python = {
    type = 'executable';
    command = '/Users/fujimotogen/.pyenv/versions/debugpy/bin/python';
    args = { '-m', 'debugpy.adapter' };
  }
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
      runInTerminal = false,
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
  dap.configurations.python = {
    {
      type = 'python';
      request = 'launch';
      name = "Launch file";
      program = "${file}"; -- This configuration will launch the current file if used.
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/usr/bin/python'
        end
      end;
    },
  }
end

-- KEYMAPS
vim.api.nvim_set_keymap('n', '<leader>db', [[:lua require'dap'.continue()<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dn', [[:lua require'dap'.continue()<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ds', [[:lua require'dap'.step_over()<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>di', [[:lua require'dap'.step_into()<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dd', [[:lua require'dap'.toggle_breakpoint()<cr>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dD', [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dp', [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dr', [[:lua require'dap'.repl.open()<CR>:wincmd h<cr>:set]], {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dl', [[:lua require'dap'.run_last()<CR>]], {noremap = true, silent = true})

function Dap_Setup()
  vim.cmd[[autocmd FileType dap-repl setlocal nobuflisted]]
  require'dap'.continue()
  vim.fn.feedkeys(':only\n', 'x')
  local cur_win = vim.api.nvim_get_current_win()
  local cur_win_height = vim.api.nvim_win_get_height(cur_win)
  local widgets = require('dap.ui.widgets')
  local my_sidebar = widgets.sidebar(widgets.scopes)
  my_sidebar.open()
  -- my_sidebar = widgets.sidebar(widgets.frames)
  -- my_sidebar.open()
  require'dap'.repl.open()
  vim.api.nvim_win_set_height(cur_win, math.floor(cur_win_height*3/4))
end

function Dap_Float()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end

function M.dap_ui()
  require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
    },
    sidebar = {
      -- open_on_start = true,
      elements = {
        { id = "scopes", size = 0.33, },
        { id = "breakpoints", size = 0.33 },
        { id = "stacks", size = 0.33 },
        -- { id = "watches", size = 00.25 },
      },
      size = 40,
      position = "right", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
      -- open_on_start = true,
      elements = { "repl" },
      size = 15,
      position = "bottom", -- Can be "left", "right", "top", "bottom"
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
    windows = { indent = 1 },
  })

  local dap, dapui = require('dap'), require('dapui')
  dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
  dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
  dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                    « Toggle Term »                          │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.toggle_term()
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
    float_opts = {
      border = 'single', -- | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      }
    }
  }
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{              « DashBoard Configurations »                   │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.dashboard()
  vim.g.dashboard_default_executive = 'telescope'
  vim.g.dashboard_custom_section={
    buffer_list        = {
      description      = {[[ Config Files                                              ]]},
      command          = [[:cd ~/.config/nvim | Telescope find_files]]
    },
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
  vim.g.dashboard_custom_header = {[[Satellite]]}
  -- vim.g.dashboard_custom_footer = {""}
  vim.cmd [[autocmd FileType dashboard highlight DashboardHeader guifg=#9999bb]]
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{               « TODO Comment & BQF »                        │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.todo_comment()
  require("todo-comments").setup {
    keywords = {
      ERR = { icon = ' ', color = "error", alt = { "ERROR", "ERR" }, },
      FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE"}, },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO", "REF" } },
    },
  }
end

function M.bqf()
  require('bqf').setup({
    auto_enable = true,
    preview = {
      win_height = 12,
      win_vheight = 12,
      delay_syntax = 80,
      border_chars = {'│', '│', '─', '─', '╭', '╮', '╰', '╯', '▌'}
      -- border = { '╭', '─' ,'╮', '│', '╯', '─', '╰', '│' },
    },
    func_map = {
      vsplit = '',
      ptogglemode = 'z,',
      stoggleup = ''
    },
    filter = {
      fzf = {
        action_for = {['ctrl-s'] = 'split'},
        extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
      }
    }
  })
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                 « Plugin settings »                         │
-- ┼─────────────────────────────────────────────────────────────────┼

-- Easy Motion
function M.others()
  vim.g.EasyMotion_keys = 'aoeidtnpyfgcrl;qjkxbmwvzuhs'  -- This Option is For Dvorak User
  vim.g.EasyMotion_do_mapping = 0
  vim.g.EasyMotion_use_migemo = 1
  -- markdown
  vim.g.vim_markdown_math = 1
  -- Ultisnips
  vim.g.UltiSnipsExpandTrigger="<tab>"
  vim.g.UltiSnipsJumpForwardTrigger="<c-j>"
  vim.g.UltiSnipsJumpBackwardTrigger="<c-k>"
  vim.g.UltiSnipsEditSplit="vertical"
  vim.g.matchup_matchparen_offscreen = {
    method = 'popup'
  }
  -- vim.cmd[[let g:matchup_matchparen_offscreen = {'method': 'popup'}]]
end

--- }}}
-- ┼─────────────────────────────────────────────────────────────────┼

-- Export

return M
-- vim:set foldmethod=marker:
