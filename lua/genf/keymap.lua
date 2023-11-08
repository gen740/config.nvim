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

local global_keymap = {
  n = {
    ['<space>co'] = require_wrap('genf.toggleshell', 'ToggleQF'),
    ['<space>sh'] = require_wrap('genf.toggleshell', 'ToggleTerm'),
    ['<space>py'] = require_wrap('genf.toggleshell', 'ToggleIpython3'),
    ['<space>ut'] = '<cmd>UndotreeToggle<cr>',
    ['<space>p'] = '"_dP',
    ['q:'] = '<nop>',
    ['~'] = '<nop>',
    ['<c-q>'] = '<cmd>Fern . -drawer -toggle<cr>',
    ['<space>tn'] = '<cmd>tabnext<cr>',
    ['<space>tp'] = '<cmd>tabprevious<cr>',

    --- Telescope
    ['<space>tcb'] = require_wrap('telescope.builtin', 'current_buffer_fuzzy_find'),
    ['<space>tg'] = require_wrap('telescope.builtin', 'git_files'),
    ['<space>tf'] = require_wrap('telescope.builtin', 'find_files'),
    ['<space>tb'] = require_wrap('telescope.builtin', 'buffers'),
    ['<space>tl'] = require_wrap('telescope.builtin', 'live_grep'),
    ['<space>ts'] = require_wrap('telescope.builtin', 'builtin'),
    ['<space>ng'] = '<cmd>Neogit<cr>',
    ['<space>f'] = wrap(vim.lsp.buf.format, {
      async = true,
      filter = function(client)
        return client.name ~= 'tsserver' and client.name ~= 'texlab'
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
    ['<space>dn'] = '<cmd>DapContinue<cr>',
    ['<space>dd'] = '<cmd>DapToggleBreakpoint<cr>',
    ['<space>dD'] = function()
      require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end,
    ['<space>dp'] = function()
      require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end,
    ['<space>dr'] = function()
      require('dap').repl.open()
    end,
    ['<space>dl'] = function()
      require('dap').run_last()
    end,
    --- GitSigns
    ['<space>hS'] = require_wrap('gitsigns', 'stage_buffer'),
    ['<space>hu'] = require_wrap('gitsigns', 'undo_stage_hunk'),
    ['<space>hR'] = require_wrap('gitsigns', 'reset_buffer'),
    ['<space>hp'] = require_wrap('gitsigns', 'preview_hunk'),
    ['<space>hb'] = require_wrap('gitsigns', 'blame_line', { full = true }),
    ['<space>hc'] = require_wrap('gitsigns', 'toggle_current_line_blame'),
    ['<space>hd'] = require_wrap('gitsigns', 'diffthis'),
    ['<space>hD'] = require_wrap('gitsigns', 'diffthis', '~'),
    ['<space>td'] = require_wrap('gitsigns', 'toggle_deleted'),
  },
  [{ 'n', 'v' }] = {
    ['<space>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
    ['<space>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
  },
  t = {
    ['<esc><space>'] = [[<c-\><c-n>]],
    ['<esc>w'] = [[<c-\><c-n><c-w>w]],
    ['<esc>sh'] = require_wrap('genf.toggleshell', 'ToggleTerm'),
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
