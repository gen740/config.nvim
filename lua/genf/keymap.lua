-- stylua: ignore start
local map = function(mode, key, cmd, opt)
  opt = opt or { noremap = true, silent = true }
  vim.keymap.set(mode, key, cmd, opt)
end

-- require("vsnip.")

map('n', '<space>co', require('genf.toggleshell').ToggleQF)
map('n', '<space>sh', require('genf.toggleshell').ToggleTerm)
map('n', '<space>py', require('genf.toggleshell').ToggleIpython3)
map('t', '<esc><space>', [[<c-\><c-n>]])
map('t', '<esc>w', [[<c-\><c-n><c-w>w]])
map('n', '<space>ut', '<cmd>UndotreeToggle<cr>')
map('x', '<space>p', '"_dP')
map('n', 'q:', '<nop>')
map('n', '~', '<nop>')
map('n', '<c-q>', '<cmd>Fern . -drawer -toggle<cr>')
map('n', '<space>tn', '<cmd>tabnext<cr>')
map('n', '<space>tp', '<cmd>tabprevious<cr>')

map('n', '<space>sp', '<cmd>VsnipOpen -format snipmate<cr>')

-- Telescope
map('n', '<space>tcb',function() require('telescope.builtin').current_buffer_fuzzy_find() end)
map('n', '<space>tg', function() require('telescope.builtin').git_files() end)
map('n', '<space>tf', function() require('telescope.builtin').find_files() end)
map('n', '<space>tb', function() require('telescope.builtin').buffers() end)
map('n', '<space>tl', function() require('telescope.builtin').live_grep() end)
map('n', '<space>ts', function() require('telescope.builtin').builtin() end)

map('n', '<space>ng', '<cmd>Neogit<cr>')

-- LSP
map('n', '<space>f', function() vim.lsp.buf.format { async = true, timeout_ms = 1000, filter = function(client) return client.name ~= "tsserver" end } end)
map('n', '<space>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<space>lc', vim.diagnostic.setloclist)
map('n', '<space>lo', vim.lsp.buf.outgoing_calls)
map('n', '<space>li', vim.lsp.buf.incoming_calls)
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gr', vim.lsp.buf.references)
map('n', 'K', vim.lsp.buf.hover)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', '<C-k>', vim.lsp.buf.signature_help)
map('n', '<space>D', vim.lsp.buf.type_definition)
map('n', '<space>rn', vim.lsp.buf.rename)
map('n', '<space>ca', function() vim.lsp.buf.code_action { apply = true } end)

map('n', '<space>dn', '<cmd>DapContinue<cr>')
map('n', '<space>dd', '<cmd>DapToggleBreakpoint<cr>')
map('n', '<space>dD', function() require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
map('n', '<space>dp', function() require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
map('n', '<space>dr', function() require'dap'.repl.open() end)
map('n', '<space>dl', function() require'dap'.run_last() end)

if pcall(require, 'gitsigns') then -- GitSigns
  local gs = require('gitsigns')
  map({ 'n', 'v' }, '<space>hs', ':Gitsigns stage_hunk<CR>')
  map({ 'n', 'v' }, '<space>hr', ':Gitsigns reset_hunk<CR>')
  map('n', '<space>hS', gs.stage_buffer)
  map('n', '<space>hu', gs.undo_stage_hunk)
  map('n', '<space>hR', gs.reset_buffer)
  map('n', '<space>hp', gs.preview_hunk)
  map('n', '<space>hb', function() gs.blame_line { full = true } end)
  map('n', '<space>hc', gs.toggle_current_line_blame)
  map('n', '<space>hd', gs.diffthis)
  map('n', '<space>hD', function() gs.diffthis('~') end)
  map('n', '<space>td', gs.toggle_deleted)
end

-- vsnip
map({ 'i', 's' }, '<c-f>', function()
  if vim.fn["vsnip#jumpable"](1) == 1 then
    return '<Plug>(vsnip-jump-next)'
  else
    return '<c-f>'
  end
end, { noremap = true, silent = true, expr = true })

map({ 'i', 's' }, '<c-b>', function()
  if vim.fn["vsnip#jumpable"](-1) == 1 then
    return '<Plug>(vsnip-jump-prev)'
  else
    return '<c-b>'
  end
end, { noremap = true, silent = true, expr = true })

map({ 'i', 's' }, '<c-e>', function()
  if vim.fn["vsnip#available"]() == 1 then
    return '<Plug>(vsnip-expand-or-jump)'
  else
    return '<c-e>'
  end
end, { noremap = true, silent = true, expr = true })

-- SKK
map({ 'n', 'i' }, '<m-u>', '<Plug>(skkeleton-enable)')

-- stylua: ignore end
