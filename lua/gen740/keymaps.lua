local global_keymap = {
  i = {
    ['<c-h>'] = '<cmd>Copilot suggestion next<cr>',
    ['<c-l>'] = '<cmd>Copilot suggestion prev<cr>',
    ['<c-t>'] = '<cmd>Copilot suggestion accept<cr>',
    ['<m-w>'] = '<cmd>Copilot suggestion accept_word<cr>',
    ['<m-l>'] = '<cmd>Copilot suggestion accept_line<cr>',
  },
  n = {
    ['-'] = '<cmd>Oil<cr>',
    ['<m-f>'] = function()
      vim.lsp.buf.format {
        async = false,
        filter = function(client)
          return (client.name ~= 'tsserver' and client.name ~= 'vtsls' and client.name ~= 'texlab')
        end,
      }
    end,

    --- LSP
    ['<space>e'] = vim.diagnostic.open_float,
    ['[d'] = function()
      vim.diagnostic.jump { count = -1, float = true }
    end,
    [']d'] = function()
      vim.diagnostic.jump { count = 1, float = true }
    end,
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
    ['<space>ca'] = function()
      vim.lsp.buf.code_action { apply = true }
    end,
  },
  x = {
    ['<space>p'] = '"_dP',
  },
  t = {
    ['<esc><esc>'] = '<C-\\><C-n>',
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
