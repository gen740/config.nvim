M = {}

function Lsp_on_attach(client, bufnr)
    require("lsp-inlayhints").on_attach(client, bufnr, true)
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
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
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
    if client["server_capabilities"]["documentFormattingProvider"] then
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, bufopts)
    end
end

function M.inlay_hints()
    require("lsp-inlayhints").setup {
        inlay_hints = {
            parameter_hints = {
                show = true,
                prefix = "← ",
                separator = ", ",
                remove_colon_start = false,
                remove_colon_end = true,
            },
            type_hints = {
                show = true,
                prefix = "∷ ",
                separator = ", ",
                remove_colon_start = true,
                remove_colon_end = false,
            },
            only_current_line = false,
            labels_separator = " ",
            max_len_align = false,
            max_len_align_padding = 1,
            -- highlight group
            highlight = "LspInlayHint",
        },
        enabled_at_startup = true,
        debug_mode = false,
    }
end

function M.mason()
    require "mason".setup({})
    require("mason-lspconfig").setup({
        ensure_installed = { "sumneko_lua", "rust_analyzer", "pyright", "clangd" }
    })
end

function M.nvim_lsp()
    local lspconfig = require("lspconfig")
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

    vim.lsp.for_each_buffer_client(0, function(client)
        if client.name ~= "" then
            client.server_capabilities.document_formatting = true
            client.server_capabilities.document_range_formatting = true
        end
    end)
end

return M
