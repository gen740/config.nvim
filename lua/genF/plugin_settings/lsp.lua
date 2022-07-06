M = {}

function Lsp_on_attach(_, bufnr)
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
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.format {async = true}<CR>", opts)
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
        "pylsp",
        "gopls",
        "sourcekit",
        "cmake",
        "julials",
        "yamlls"
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
    lspconfig.pylsp.setup {
        settings = {
            pylsp = {
                -- configurationSources = { "flake8" },
                plugins = {
                    -- jedi_completion = { enabled = true },
                    -- jedi_hover = { enabled = true },
                    -- jedi_references = { enabled = true },
                    -- jedi_signature_help = { enabled = true },
                    -- jedi_symbols = { enabled = true, all_scopes = true },
                    pycodestyle = { enabled = true },
                    -- flake8 = {
                    --     enabled = true,
                    --     ignore = {},
                    --     maxLineLength = 160
                    -- },
                    -- mypy = { enabled = true },
                    isort = { enabled = true },
                    -- yapf = { enabled = false },
                    -- pylint = { enabled = false },
                    -- pydocstyle = { enabled = false },
                    -- mccabe = { enabled = false },
                    -- preload = { enabled = false },
                    -- rope_completion = { enabled = false }
                }
            }
        },
        on_attach = Lsp_on_attach
    }
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
