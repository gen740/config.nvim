local function wrap(func, ...)
  local args = { ... } -- Capture the variable arguments in a local variable
  return function()
    if args ~= nil then
      return func(unpack(args)) -- Call the original function with the captured arguments
    else
      return func()
    end
  end
end

local function require_wrap(module_name, func, ...)
  local args = { ... }
  return function()
    if args ~= nil then
      return require(module_name)[func](unpack(args))
    else
      return require(module_name)[func]()
    end
  end
end

--stylua: ignore start
local global_keymap = {
  n = {
    ['-'] = '<cmd>Oil<cr>',

    ['<space>co'] = require_wrap('genf.toggleshell', 'ToggleQF'),
    ['<space>sh'] = require_wrap('genf.toggleshell', 'ToggleTerm'),
    ['<space>py'] = require_wrap('genf.toggleshell', 'ToggleIpython3'),
    ['<space>p'] = '"_dP',
    ['~'] = '<nop>',

    --- Telescope
    ['<space>tcb'] = require_wrap('telescope.builtin', 'current_buffer_fuzzy_find'),
    ['<space>tg'] = require_wrap('telescope.builtin', 'git_files'),
    ['<space>tf'] = require_wrap('telescope.builtin', 'find_files'),
    ['<space>tb'] = require_wrap('telescope.builtin', 'buffers'),
    ['<space>tl'] = require_wrap('telescope.builtin', 'live_grep'),
    ['<space>ts'] = require_wrap('telescope.builtin', 'builtin'),
    ['<space>lg'] = require("genf.lazygit").lazygit_open,

    ['<space>f'] = wrap(vim.lsp.buf.format, {
      async = false,
      filter = function(client)
        return (client.name ~= 'tsserver' and client.name ~= 'vtsls' and client.name ~= 'texlab')
      end,
    }),

    --- LSP
    ['<space>e'] = vim.diagnostic.open_float,
    ['[d'] = vim.diagnostic.goto_prev,
    [']d'] = vim.diagnostic.goto_next,
    ['<space>lc'] = vim.diagnostic.setloclist,
    ['<space>lo'] = vim.lsp.buf.outgoing_calls,
    ['<space>li'] = vim.lsp.buf.incoming_calls,
    ['gD'] = vim.lsp.buf.declaration,
    ['gd'] = vim.lsp.buf.definition,
    ['gr'] = vim.lsp.buf.references,
    ['K'] = vim.lsp.buf.hover,
    ['gi'] = vim.lsp.buf.implementation,
    ['<C-k>'] = vim.lsp.buf.signature_help,
    ['<space>D'] = vim.lsp.buf.type_definition,
    ['<space>rn'] = vim.lsp.buf.rename,
    ['<space>ca'] = wrap(vim.lsp.buf.code_action, { apply = true }),

    --- VSnip
    ['<space>sp'] = '<cmd>VsnipOpen -format snipmate<cr>',

    --- Dap
    ['<m-b>'] = require_wrap('dap', 'toggle_breakpoint'),
    ['<m-n>'] = require_wrap('dap', 'continue'),
    ['<m-i>'] = require_wrap('dap', 'step_into'),
    ['<m-o>'] = require_wrap('dap', 'step_out'),
    ['<m-s>'] = require_wrap('dap', 'step_over'),
    ['<space>dl'] = require_wrap('dap', 'run_last'),
  },
  [{ 'n', 'v' }] = {
    ['go'] = "<cmd>GitOpenPathInBrowser<cr>",
  },
  x = {
    ['<space>p'] = '"_dP',
  },
}

for mode, keys in pairs(global_keymap) do
  for key, callback in pairs(keys) do
    vim.keymap.set(mode, key, callback, { noremap = true, silent = true })
  end
end
