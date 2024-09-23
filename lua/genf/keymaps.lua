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
  i = {
  -- ['<m-c>'] = '<cmd>Copilot suggestion toggle_auto_trigger<cr>',
    ['<m-]>'] = '<cmd>Copilot suggestion next<cr>',
    ['<m-[>'] = '<cmd>Copilot suggestion prev<cr>',
    ['<m-f>'] = '<cmd>Copilot suggestion accept<cr>',
    -- ['<m-p>'] = '<cmd>Copilot panel open<cr>',
  },
  n = {
    ['-'] = '<cmd>Oil<cr>',

    ['<space>co'] = require_wrap('genf.toggleshell', 'Quickfix'),
    ['<space>sh'] = require_wrap('genf.toggleshell', 'Zsh'),
    ['<space>py'] = require_wrap('genf.toggleshell', 'Ipython'),
    ['<space>cc'] = require_wrap('genf.toggleshell', 'Console'),

    -- Run Manager
    ['<space>rr'] = require_wrap('genf.run_manager', 'run', false, false),
    ['<space>rc'] = require_wrap('genf.run_manager', 'register', false, false),

    -- Run Manager for Git
    ['<space>gr'] = require_wrap('genf.run_manager', 'run', false, true),
    ['<space>gcr'] = require_wrap('genf.run_manager', 'register', false, true),

    -- Build Manager
    ['<space>br'] = require_wrap('genf.run_manager', 'run',true, false),
    ['<space>bc'] = require_wrap('genf.run_manager', 'register',true,false),

    -- Build Manager for Git
    ['<space>gb'] = require_wrap('genf.run_manager', 'run', true, true),
    ['<space>gcb'] = require_wrap('genf.run_manager', 'register', true, true),

    ['<space>gg'] = ':silent grep ',

    ['<space>p'] = '"_dP',
    ['~'] = '<nop>',

    --- Telescope
    ['<space>tcb'] = require_wrap('telescope.builtin', 'current_buffer_fuzzy_find'),
    ['<space>tg'] = require_wrap('telescope.builtin', 'git_files'),
    ['<space>tf'] = require_wrap('telescope.builtin', 'find_files'),
    ['<space>tb'] = require_wrap('telescope.builtin', 'buffers'),
    ['<space>tl'] = require_wrap('telescope.builtin', 'live_grep'),
    ['<space>ts'] = require_wrap('telescope.builtin', 'builtin'),
    ['<space>lg'] = require('genf.lazygit').lazygit_open,

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

    --- n
    ['<m-n>'] = "<cmd>cn<cr>",
    ['<m-p>'] = "<cmd>cp<cr>",

    --- VSnip
    ['<space>sp'] = '<cmd>VsnipOpen -format snipmate<cr>',

    --- Dap
    ['<m-b>'] = require_wrap('dap', 'toggle_breakpoint'),
    ['<m-c>'] = require_wrap('dap', 'continue'),
    ['<m-i>'] = require_wrap('dap', 'step_into'),
    ['<m-o>'] = require_wrap('dap', 'step_out'),
    ['<m-s>'] = require_wrap('dap', 'step_over'),
    ['<space>dl'] = require_wrap('dap', 'run_last'),
  },
  [{ 'i', 's' }] = {
    ['<c-f>'] = {
      function()
        if vim.fn['vsnip#jumpable'](1) == 1 then
          return '<Plug>(vsnip-jump-next)'
        else
          return '<c-f>'
        end
      end,
      { noremap = true, silent = true, expr = true },
    },
    ['<c-b>'] = {
      function()
        if vim.fn['vsnip#jumpable'](-1) == 1 then
          return '<Plug>(vsnip-jump-prev)'
        else
          return '<c-b>'
        end
      end,
      { noremap = true, silent = true, expr = true },
    },
    ['<tab>'] = {
      function()
        if vim.fn['vsnip#available']() == 1 then
          return '<Plug>(vsnip-expand)'
        else
          return '<tab>'
        end
      end,
      { noremap = true, silent = true, expr = true },
    },
  },
  x = {
    ['<space>p'] = '"_dP',
  },
}

for mode, keys in pairs(global_keymap) do
  for key, callback in pairs(keys) do
    if type(callback) == 'table' then
      vim.keymap.set(mode, key, callback[1], callback[2])
    else
      vim.keymap.set(mode, key, callback, { noremap = true, silent = true })
    end
  end
end
