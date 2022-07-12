M = {}

function Lsp_on_attach(_, bufnr)
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set('omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

function M.nvim_lsp()
    -- lsp-installer
    -- require("nvim-lsp-installer").setup {
    --     ui = {
    --         icons = {
    --             server_installed = "✓",
    --             server_pending = "➜",
    --             server_uninstalled = "✗",
    --         },
    --     },
    -- }
    -- lspconfig
    local lspconfig = require("lspconfig")
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

    local servers = {
        "rust_analyzer",
        "tsserver",
        "texlab",
        "gopls",
        -- "sourcekit",
        "pyright",
        "clangd",
        "cmake",
        "julials",
        "yamlls",
        "zls"
    }

    for _, lsp in pairs(servers) do
        lspconfig[lsp].setup({
            on_attach = Lsp_on_attach,
        })
    end

    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    lspconfig.sumneko_lua.setup {
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
    }
    -- lspconfig.pylsp.setup {
    --     settings = {
    --         pylsp = {
    --             -- configurationSources = { "flake8" },
    --             plugins = {
    --                 jedi_completion = { enabled = true },
    --                 -- jedi_hover = { enabled = true },
    --                 -- jedi_references = { enabled = true },
    --                 jedi_signature_help = { enabled = true },
    --                 -- jedi_symbols = { enabled = true, all_scopes = true },
    --                 -- pycodestyle = { enabled = true },
    --                 -- flake8 = {
    --                 --     enabled = true,
    --                 --     ignore = {},
    --                 --     maxLineLength = 160
    --                 -- },
    --                 -- mypy = { enabled = true },
    --                 -- isort = { enabled = true },
    --                 -- yapf = { enabled = false },
    --                 -- pylint = { enabled = false },
    --                 -- pydocstyle = { enabled = false },
    --                 -- mccabe = { enabled = false },
    --                 -- preload = { enabled = false },
    --                 -- rope_completion = { enabled = false }
    --             }
    --         }
    --     },
    --     on_attach = Lsp_on_attach
    -- }
    lspconfig.jsonls.setup {
        on_attach = Lsp_on_attach,
        filetypes = { "json", "jsonc" },
        settings = {
            json = {
                schemas = {
                    { fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" },
                    { fileMatch = { "tsconfig*.json" }, url = "https://json.schemastore.org/tsconfig.json" },
                },
            },
        }
    }
    lspconfig.tsserver.setup {
        on_attach = Lsp_on_attach,
        root_dir = require("lspconfig").util.root_pattern("package.json", "tsconfig.json"),
    }
    lspconfig.denols.setup {
        on_attach = Lsp_on_attach,
        root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
    }
    vim.lsp.for_each_buffer_client(0, function(client)
        if client.name ~= "" then
            client.server_capabilities.document_formatting = true
            client.server_capabilities.document_range_formatting = true
        end
    end)
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
            null_ls.builtins.formatting.swiftformat,

            -- null_ls.builtins.diagnostics.eslint,
            -- null_ls.builtins.formatting.fprettify,
            null_ls.builtins.formatting.autopep8,
            -- null_ls.builtins.diagnostics.teal,
            -- null_ls.builtins.diagnostics.vint,
            -- null_ls.builtins.diagnostics.vale,
        },
    })
end

return M
