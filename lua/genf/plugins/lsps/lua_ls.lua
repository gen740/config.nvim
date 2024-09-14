if vim.fn.executable('lua-language-server') == 0 then
  return
end

local lsp_utils = require('genf.language_services.utils')
local config = require('lspconfig')['lua_ls']

local libraries = {
  '${3rd}/luv/library',
  '${3rd}/luassert/library',
}

do
  local path = vim.opt.packpath:get()[1] .. '/pack/myNeovimPackages/start'
  local handle = vim.loop.fs_scandir(path)
  while handle do
    local name, _ = vim.loop.fs_scandir_next(handle)
    if not name then
      break
    end
    table.insert(libraries, path .. '/' .. name)
  end
end

do
  local runtimes = vim.opt.runtimepath:get()
  for _, r in pairs(runtimes) do
    if vim.endswith(r, 'share/nvim/runtime') then
      table.insert(libraries, r)
    end
  end
end

config.setup {
  capabilities = lsp_utils.capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = libraries,
        checkThirdParty = 'Disabled',
      },
      telemetry = {
        enable = false,
      },
      format = {
        enable = false,
      },
    },
  },
}
