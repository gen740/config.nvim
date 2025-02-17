require('lspconfig')['jsonls'].setup {
  capabilities = require('gen740.plugins.lsps.utils').capabilities,
  filetypes = { 'json', 'jsonc' },
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { 'package.json' },
          url = 'https://json.schemastore.org/package.json',
        },
        {
          fileMatch = { 'tsconfig*.json' },
          url = 'https://json.schemastore.org/tsconfig.json',
        },
        {
          fileMatch = { '.luarc.json' },
          url = 'https://raw.githubusercontent.com/sumneko/vscode-lua/master/setting/schema.json',
        },
        {
          fileMatch = { 'pyrightconfig.json' },
          url = 'https://raw.githubusercontent.com/microsoft/pyright/main/packages/vscode-pyright/schemas/pyrightconfig.schema.json',
        },
        {
          fileMatch = { 'biome.json' },
          url = 'https://biomejs.dev/schemas/1.6.1/schema.json',
        },
        {
          fileMatch = { 'appsscript.json' },
          url = 'https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/appsscript.json',
        },
        {
          fileMatch = { 'deno.json' },
          url = 'https://raw.githubusercontent.com/denoland/deno/v1.41.0/cli/schemas/config-file.v1.json',
        },
      },
    },
  },
}
