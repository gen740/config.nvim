M = {}

-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                    « Treesitter »                           │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.treesitter()
    require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "python", "cpp", "lua", "rust", "vim" },
        highlight = { enable = true },
        indent = { enable = false },
        yati = { enable = true },
        refactor = {
            highlight_definitions = { enable = true },
            highlight_current_scope = { enable = false },
        },
        matchup = {
            enable = true,
        },
        autotag = {
            enable = true,
        }
    })
end

function M.treesitter_context()
    require 'treesitter-context'.setup {
        enable = true,
        throttle = true,
        max_lines = 0,
        patterns = {
            default = {
                'class',
                'function',
                'method',
                -- 'for', -- These won't appear in the context
                -- 'while',
                -- 'if',
                -- 'switch',
                -- 'case',
            },
        }
    }
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{             « Telescope Configurations »                    │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.telescope()
    local actions = require("telescope.actions")
    require("telescope").setup({
        defaults = {
            mappings = {
                i = {
                    ["<cr>"] = actions.select_default,
                    ["<esc>"] = actions.close,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["<cr>"] = actions.select_default,
                },
            },
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--trim"
            },
            prompt_prefix = "  ",
            layout_config = {
                prompt_position = "top",
                width = 0.8,
            },
            selection_caret = " ▶ ",
            entry_prefix = "   ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            file_ignore_patterns = {
                "node_modules/*",
                "legacy/*",
                "third_parties/*",
                "overrides/*",
                "__pycache__",
                ".github",
                ".cache",
                ".DS_Store",
                ".gitignore",
            },
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            color_devicons = true,
            use_less = true,
        },
        pickers = {
            find_files = {
                find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
            },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        },
    })
    require("telescope").load_extension("fzf")
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{             « Nvim Tree Configurations »                    │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.nvim_tree()
    require("nvim-tree").setup({
        disable_netrw = false,
        hijack_netrw = false,
        open_on_setup = false,
        ignore_ft_on_setup = {},
        open_on_tab = false,
        hijack_cursor = true,
        update_cwd = false,
        lsp_diagnostics = true,
        update_focused_file = {
            enable = false,
            update_cwd = false,
            ignore_list = {},
        },
        system_open = {
            cmd = nil,
            args = {},
        },
        view = {
            width = 30,
            side = "left",
            auto_resize = false,
            mappings = {
                custom_only = false,
                list = {},
            },
        },
    })
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{             « Git signs Configurations »                    │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.gitsigns()
    require("gitsigns").setup({
        signs = {
            add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
            change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
            delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
            topdelete = {
                hl = "GitSignsDelete",
                text = "‾",
                numhl = "GitSignsDeleteNr",
                linehl = "GitSignsDeleteLn",
            },
            changedelete = {
                hl = "GitSignsChange",
                text = "~",
                numhl = "GitSignsChangeNr",
                linehl = "GitSignsChangeLn",
            },
        },
        numhl = true,
        linehl = false,
        keymaps = {
            -- Default keymap options
            noremap = true,
            buffer = true,
            ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
            ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },
            ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
            ["v <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
            ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
            ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
            ["v <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
            ["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
            ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<cr>',
            ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line(true)<cr>',
            -- text objects
            ["o ih"] = ':<c-u>lua require"gitsigns.actions".select_hunk()<cr>',
            ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        },
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },
        sign_priority = 6,
        update_debounce = 1000,
        status_formatter = nil, -- Use default
        word_diff = false,
    })
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                  « Indent Blank Line »                      │
-- ┼─────────────────────────────────────────────────────────────────┼
function M.indent_blankline()
    vim.cmd([[autocmd FileType * highlight IndentBlanklineIndent1 guifg=#665c54 blend=nocombine]])
    vim.cmd([[autocmd FileType * highlight IndentBlanklineIndent2 guifg=#3c3836 blend=nocombine]])
    vim.cmd([[autocmd FileType * highlight IndentBlanklineBlue guifg=#458588 blend=nocombine]])
    vim.cmd([[autocmd FileType * highlight IndentBlanklinePurple guifg=#b16286 blend=nocombine]])
    vim.cmd([[autocmd FileType * highlight IndentBlanklineAqua guifg=#a381ff blend=nocombine]])
    vim.cmd([[autocmd FileType * highlight IndentBlanklineRed guifg=#719cd6 blend=nocombine]])
    vim.cmd([[autocmd FileType * highlight IndentBlanklineOrange guifg=#fe8019 blend=nocombine]])
    vim.cmd([[autocmd FileType * highlight IndentBlanklineGreen guifg=#98971a blend=nocombine]])
    vim.cmd([[autocmd FileType * highlight IndentBlanklineGray guifg=#928374 blend=nocombine]])

    vim.g.indentLine_fileTypeExclude = { "dashboard", "markdown", "NvimTree", "toggleterm", "qf" }
    -- vim.g.indent_blankline_use_treesitter = true
    vim.g.indent_blankline_show_current_context = true
    vim.g.indent_blankline_context_patterns = {
        "^if", "argument_list", "array", "arrow_function",
        "block", "case_statement", "class", "dictionary",
        "dictionnary", "element", "enum_body", "enum_item",
        "environment", "except", "for", "func_literal",
        "function", "import", "method", "object",
        "switch_statement", "table", "try", "while", "with",
    }
    vim.g.indent_blankline_context_highlight_list = {
        "IndentBlanklineAqua",
        "IndentBlanklineAqua",
        "IndentBlanklineAqua",
        "IndentBlanklineAqua",
        "IndentBlanklineAqua",
        "IndentBlanklineAqua",
    }
    require("indent_blankline").setup({
        buftype_exclude = { "dashboard", "markdown" },
        space_char_blankline = " ",
        char = "▏", -- '▏', '┊', '│', '⎸'
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
        },
    })
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                      « Zen Mode »                           │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.Zen_init()
    require("zen-mode").setup({
        window = {
            backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
            width = 100, -- width of the Zen window
            height = 1, -- height of the Zen window
            options = {
                cursorcolumn = false, -- disable cursor column
                foldcolumn = "0", -- disable fold column
            },
        },
        plugins = {
            options = {
                enabled = true,
                ruler = false, -- disables the ruler text in the cmd line area
                showcmd = false, -- disables the command in the last line of the screen
            },
            twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
            gitsigns = { enabled = true }, -- disables git signs
            tmux = { enabled = true }, -- disables the tmux statusline
        },
        on_open = function() end,
        on_close = function() end,
    })
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                 « LSP Configurations »                      │
-- ┼─────────────────────────────────────────────────────────────────┼

Lsp_on_attach = function(_, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end


function M.nvim_lsp()
    local servers = { "clangd", "rust_analyzer", "tsserver" }
    local border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
    }

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or border
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

    for _, lsp in pairs(servers) do
        require("lspconfig")[lsp].setup({
            on_attach = Lsp_on_attach,
        })
    end

    vim.lsp.for_each_buffer_client(0, function(client)
        if client.name ~= "" then
            client.server_capabilities.document_formatting = true
            client.server_capabilities.document_range_formatting = true
        end
    end)
end

function M.LspInstaller()
    local lsp_installer = require("nvim-lsp-installer")
    local flags = {
        debounce_text_changes = 100,
    }
    lsp_installer.on_server_ready(function(server)
        ---@diagnostic disable
        if server.name == "sumneko_lua" then
            local runtime_path = vim.split(package.path, ";")
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")
            server:setup({ -- ignore
                flags = flags,
                on_attach = Lsp_on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = runtime_path,
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        elseif server.name == "jsonls" then
            server:setup({
                flags = flags,
                on_attach = Lsp_on_attach,
                filetypes = { "json", "jsonc" },
                settings = {
                    json = {
                        schemas = {
                            { fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" },
                            { fileMatch = { "tsconfig*.json" }, url = "https://json.schemastore.org/tsconfig.json" },
                        },
                    },
                },
            })
        elseif server.name == "tsserver" then
            server:setup({
                flags = flags,
                on_attach = Lsp_on_attach,
                root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json"),
            })
        elseif server.name == "denols" then
            server:setup({
                flags = flags,
                on_attach = Lsp_on_attach,
                root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
            })
        else
            server:setup({
                flags = flags,
                on_attach = Lsp_on_attach,
            })
        end
        ---@diagnostic enable
    end)
    lsp_installer.settings({
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗",
            },
        },
    })
end

function M.null_ls()
    local null_ls = require("null-ls")
    require("null-ls").setup({
        sources = {
            -- null_ls.builtins.formatting.stylua.with({
            --     extra_args = { "--indent-type=Spaces" },
            -- }),
            null_ls.builtins.formatting.prettier.with({
                filetypes = { "yaml", "markdown" },
            }),
            -- null_ls.builtins.formatting.fprettify,
            null_ls.builtins.formatting.autopep8,
            -- null_ls.builtins.diagnostics.teal,
            -- null_ls.builtins.diagnostics.vint,
            -- null_ls.builtins.diagnostics.vale,
        },
    })
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{              « nivm cmp Configurations »                    │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.nvim_cmp()
    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-c>"] = cmp.mapping.complete(),
            ["<C-o>"] = cmp.mapping.close(),
            ["<C-e>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        sources = {
            { name = "nvim_lsp" },
            { name = 'nvim_lsp_signature_help' },
            { name = "buffer", keyword_length = 3 },
            { name = 'nvim_lsp_document_symbol' },
            { name = "path" },
            { name = "ultisnips" },
            { name = "calc" },
        },
        formatting = {
            format = require("lspkind").cmp_format({
                mode = 'symbol',
                maxwidth = 50,
                before = function(entry, vim_item)
                    -- vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " -- .. vim_item.kind
                    vim_item.menu = ({
                        buffer = "[Buf]",
                        nvim_lsp = "[LSP]",
                        ultisnips = "[USnips]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]",
                    })[entry.source.name]
                    return vim_item
                end
            })
        },
    })
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                « Status and Tab line »                      │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.lsp_status()
    local lsp_status = require("lsp-status")
    lsp_status.register_progress()
    lsp_status.config({
        status_symbol = " ",
        current_function = true,
    })
end

function Word_count()
    return [[ : ]] .. vim.fn.wordcount()["chars"]
end

function M.lualine()
    require("lualine").setup({
        options = {
            theme = "nightfox",
            icons_enabled = 1,
            padding = 1,
            left_padding = 1,
            right_padding = 1,
            upper = false,
            lower = false,
            format = nil,
            section_separators = { "", "" },
            component_separators = { "│", "│" },
            globalstatus = vim.opt.laststatus:get(),
        },
        sections = {
            lualine_a = { { "mode", lower = true } },
            lualine_b = { "branch" },
            -- lualine_c = {{require'lsp-status'.status()}},
            lualine_c = { { "require'lsp-status'.status()" }, { Word_count } },
            lualine_x = { "filetype", "encoding" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        extensions = { "quickfix", "nvim-tree" },
    })
end

function M.bufferline()
    require("bufferline").setup({
        options = {
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            indicator_icon = "▎",
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            name_formatter = function(buf)
                if buf.name:match("%.md") then
                    return vim.fn.fnamemodify(buf.name, ":t:r")
                end
            end,
            --[[ max_name_length = 15,
      max_prefix_length = 10, ]]
            tab_size = 6,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or " "
                return "" .. icon .. count
            end,
            offsets = { { filetype = "NvimTree", text = " File Explorer", text_align = "center" } },
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = false,
            persist_buffer_sort = false,
            separator_style = "thin",
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            sort_by = "id",
        },
        highlights = {
            fill = {
                guibg = "#333333",
            },
            buffer_selected = {
                guifg = "orange",
            },
            separator_selected = {
                guifg = "#333333",
            },
            separator_visible = {
                guifg = "#333333",
            },
            separator = {
                guifg = "#333333",
            },
        },
    })
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                « Nvim Dap (Debugger) »                      │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.nvim_dap()
    local dap = require("dap")
    dap.adapters.lldb = {
        type = "executable",
        command = "/usr/local/opt/llvm/bin/lldb-vscode", -- adjust as needed
        name = "lldb",
    }
    dap.adapters.python = {
        type = "executable",
        command = "/Users/fujimotogen/.pyenv/versions/debugpy/bin/python",
        args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
    dap.configurations.python = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}", -- This configuration will launch the current file if used.
            pythonPath = function()
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                else
                    return "/usr/bin/python"
                end
            end,
        },
    }
    vim.api.nvim_set_keymap("n", "<leader>db", [[<cmd>lua require'dap'.continue()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dn", [[<cmd>lua require'dap'.continue()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>ds", [[<cmd>lua require'dap'.step_over()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>di", [[<cmd>lua require'dap'.step_into()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dd", [[<cmd>lua require'dap'.toggle_breakpoint()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dD", [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dp", [[<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dr", [[<cmd>lua require'dap'.repl.open()<CR>:wincmd h<cr>:set]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dl", [[<cmd>lua require'dap'.run_last()<CR>]], { noremap = true, silent = true })
end

function Dap_Setup()
    vim.cmd([[autocmd FileType dap-repl setlocal nobuflisted]])
    require("dap").continue()
    vim.fn.feedkeys(":only\n", "x")
    local cur_win = vim.api.nvim_get_current_win()
    local cur_win_height = vim.api.nvim_win_get_height(cur_win)
    local widgets = require("dap.ui.widgets")
    local my_sidebar = widgets.sidebar(widgets.scopes)
    my_sidebar.open()
    -- my_sidebar = widgets.sidebar(widgets.frames)
    -- my_sidebar.open()
    require("dap").repl.open()
    vim.api.nvim_win_set_height(cur_win, math.floor(cur_win_height * 3 / 4))
end

function Dap_Float()
    local widgets = require("dap.ui.widgets")
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
                { id = "scopes", size = 0.33 },
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

    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                    « Toggle Term »                          │
-- ┼─────────────────────────────────────────────────────────────────┼

function M.toggle_term()
    require("toggleterm").setup {
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return 15
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.3
            end
        end,
        open_mapping = [[<m-w>]],
        -- hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = "horizontal", -- 'vertical' | 'horizontal' | 'window' | 'float',
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
    }
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                      « Lexima »                             │
-- ┼─────────────────────────────────────────────────────────────────┼
function M.lexima_init()
    vim.defer_fn(function()
        -- lexima
        vim.cmd([[
    try
        let g:lexima_enable_basic_rules = 1
        let g:lexima_enable_newline_rules = 1
        let g:lexima_enable_endwise_rules = 1
        call lexima#set_default_rules()
    catch
        echo "Please install Lexima Plugin"
    endtry
    ]]   )
    end, 100)
end

--}}}
-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                 « Plugin settings »                         │
-- ┼─────────────────────────────────────────────────────────────────┼

-- Easy Motion
function M.others()
    vim.defer_fn(function()
        vim.g.EasyMotion_keys = "aoeidtnpyfgcrl;qjkxbmwvzuhs" -- This Option is For Dvorak User
        vim.g.EasyMotion_do_mapping = 0
        vim.g.EasyMotion_use_migemo = 1
        vim.g.EasyMotion_startofline = 0

        -- markdown
        vim.g.vim_markdown_math = 1

        -- Ultisnips
        vim.g.UltiSnipsExpandTrigger = "<tab>"
        vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
        vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
        vim.g.UltiSnipsEditSplit = "vertical"
        vim.g.matchup_matchparen_offscreen = { method = "popup" }

        -- Set ColorScheme
    end, 100
    )
    vim.cmd([[
    try
        colo nightfox
    catch
        echo "there is on colorscheme nightfox"
    endtry
    ]])
end

-- }}}
-- ┼─────────────────────────────────────────────────────────────────┼

return M
-- vim:set foldenable foldmethod=marker foldlevel=0 nowrap:
