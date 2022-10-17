M = {}

function Lsp_on_attach(client, bufnr)
  require('lsp-inlayhints').on_attach(client, bufnr, true)
end

function M.inlay_hints()
  require('lsp-inlayhints').setup({
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
  })
end

function M.mason()
  require('mason').setup({})
  require('mason-lspconfig').setup({
    ensure_installed = {
      'sumneko_lua',
      'rust_analyzer',
      'pyright',
      'clangd',
      'bashls',
      'haskell-language-server',
    },
  })
end

function M.nvim_lsp()
  local lspconfig = require('lspconfig')
  local servers = {
    'rust_analyzer',
    'tsserver',
    'dockerls',
    'texlab',
    'gopls',
    -- "sourcekit",
    'pyright',
    'clangd',
    'perlnavigator',
    'cmake',
    'julials',
    'yamlls',
    'zls',
    'hls',
  }

  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  for _, lsp in pairs(servers) do
    lspconfig[lsp].setup({
      capabilities = capabilities,
      on_attach = Lsp_on_attach,
    })
  end

  lspconfig.sourcekit.setup({
    capabilities = capabilities,
    on_attach = Lsp_on_attach,
    filetype = { 'swift', 'objective-c', 'objective-cpp' },
  })

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')
  lspconfig.sumneko_lua.setup({
    capabilities = capabilities,
    on_attach = Lsp_on_attach,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
        format = {
          enble = false,
        },
      },
    },
  })

  lspconfig.jsonls.setup({
    capabilities = capabilities,
    on_attach = Lsp_on_attach,
    filetypes = { 'json', 'jsonc' },
    settings = {
      json = {
        schemas = {
          { fileMatch = { 'package.json' }, url = 'https://json.schemastore.org/package.json' },
          { fileMatch = { 'tsconfig*.json' }, url = 'https://json.schemastore.org/tsconfig.json' },
        },
      },
    },
  })

  vim.lsp.for_each_buffer_client(0, function(client)
    if client.name ~= '' then
      client.server_capabilities.document_formatting = true
      client.server_capabilities.document_range_formatting = true
    end
  end)
end

return M
