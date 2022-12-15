vim.g.mapleader = [[ ]]
local map = function(mode, key, cmd)
  vim.keymap.set(mode, key, cmd, { noremap = true, silent = true })
end

-- stylua: ignore start
map('n', '<m-j>', '<cmd>resize +2<cr>')
map('n', '<m-h>', '<cmd>vertical resize -2<cr>')
map('n', '<m-l>', '<cmd>vertical resize +2<cr>')
map('n', '<m-k>', '<cmd>resize -2<cr>')

map('n', '<m-q>', require("genf.toggleshell").ToggleQF)
map('n', '<m-w>', require("genf.toggleshell").ToggleTerm)
map('t', '<m-w>', require("genf.toggleshell").ToggleTerm)
map('n', '<m-p>', require("genf.toggleshell").ToggleIpython3)
map('t', '<m-p>', require("genf.toggleshell").ToggleIpython3)
map('n', '<m-j>', require("genf.toggleshell").ToggleJulia)
map('t', '<m-j>', require("genf.toggleshell").ToggleJulia)
-- map('t', '<m-b>', [[<c-\><c-n>]])
map('t', '<esc>', [[<c-\><c-n>]])

map('n', '<leader>tcb', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>tb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>tg', '<cmd>Telescope git_files<cr>')
map('n', '<leader>tf', '<cmd>Telescope find_files<cr>')
map('n', '<leader>tn', '<cmd>Telescope buffers<cr>')
map('n', '<leader>tl', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>ts', ':Telescope ')
map('n', '<leader>ut', '<cmd>UndotreeToggle<cr>')
map('n', 'j', 'gj')
map('n', 'gj', 'j')
map('n', 'k', 'gk')
map('n', 'gk', 'k')
map('v', '<leader>s', ':sort<cr>')
map('x', '<leader>p', '\"_dP')
map('n', 'q:', '<nop>')
map('n', '<c-q>', '<cmd>Fern . -drawer -toggle<cr>')

map('n', '<leader>rr', require("genf.asyncrun").asyncrun)
map('n', '<leader>rs', require("genf.asyncrun").asyncstop)

-- LSP
map('n', '<leader>f', function() vim.lsp.buf.format { async = true, timeout_ms = 1000  } end)
map('n', '<leader>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '[c', "<cmd>cp<cr>")
map('n', ']c', "<cmd>cn<cr>")
map('n', '<leader>lc', vim.diagnostic.setloclist)
map('n', 'gD', vim.lsp.buf.declaration)
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'K', vim.lsp.buf.hover)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', '<C-k>', vim.lsp.buf.signature_help)
map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
map('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
map('n', '<leader>D', vim.lsp.buf.type_definition)
map('n', '<leader>rn', vim.lsp.buf.rename)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', 'gr', vim.lsp.buf.references)
-- map('n', 'o', 'zzo')
-- map('n', 'O', 'zzO')


-- Dap
if pcall(require, 'dap') then
  map('n', '<leader>db', require "dap".continue)
  map('n', '<leader>dn', require "dap".continue)
  map('n', '<m-n>', require "dap".step_over)
  map('n', '<m-i>', require "dap".step_into)
  map('n', '<leader>dd', require "dap".toggle_breakpoint)
  map('n', '<leader>dD', function() require "dap".set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
  map('n', '<leader>dp', function() require "dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
  map('n', '<leader>dr', require "dap".repl.open)
  map('n', '<leader>dl', require "dap".run_last)
end

-- GitSigns
if pcall(require, 'gitsigns') then
  local gs = require "gitsigns"
  map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
  map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
  map('n', '<leader>hS', gs.stage_buffer)
  map('n', '<leader>hu', gs.undo_stage_hunk)
  map('n', '<leader>hR', gs.reset_buffer)
  map('n', '<leader>hp', gs.preview_hunk)
  map('n', '<leader>hb', function() gs.blame_line { full = true } end)
  map('n', '<leader>hc', gs.toggle_current_line_blame)
  map('n', '<leader>hd', gs.diffthis)
  map('n', '<leader>hD', function() gs.diffthis('~') end)
  map('n', '<leader>td', gs.toggle_deleted)
end

--  tylua: ignore end
