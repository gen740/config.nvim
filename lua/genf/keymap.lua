vim.g.mapleader = [[ ]]
local map = function(mode, key, cmd)
  -- vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true })
  vim.keymap.set(mode, key, cmd, { noremap = true, silent = true })
end

-- stylua: ignore start
map('n', '<c-q>', '<cmd>NvimTreeToggle<cr>')
map('n', '<m-j>', '<cmd>resize +2<cr>')
map('n', '<m-h>', '<cmd>vertical resize -2<cr>')
map('n', '<m-l>', '<cmd>vertical resize +2<cr>')
map('n', '<m-k>', '<cmd>resize -2<cr>')
map('n', '<m-n>', '<cmd>cn<cr>')

map('n', '<leader>q', require("genf.toggleshell").ToggleQF)
map('n', '<m-w>', require("genf.toggleshell").ToggleTerm)
map('t', '<m-w>', require("genf.toggleshell").ToggleTerm)
map('n', '<m-p>', require("genf.toggleshell").ToggleIpython3)
map('t', '<m-p>', require("genf.toggleshell").ToggleIpython3)
map('n', '<m-j>', require("genf.toggleshell").ToggleJulia)
map('t', '<m-j>', require("genf.toggleshell").ToggleJulia)
map('t', '<m-b>', [[<c-\><c-n>]])

map('n', '<leader>co', '<cmd>copen<cr><C-w>p')
map('n', '<leader>tcb', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>tb', '<cmd>Telescope git_branches<cr>')
map('n', '<leader>tg', '<cmd>Telescope git_files<cr>')
map('n', '<leader>tf', '<cmd>Telescope find_files<cr>')
map('n', '<leader>tn', '<cmd>Telescope buffers<cr>')
map('n', '<leader>tl', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>ts', ':Telescope')
map('n', '<leader>ut', '<cmd>UndotreeToggle<cr>')
map('n', '<leader>z', '<cmd>ZenMode<cr>')
map('n', 'j', 'gj')
map('n', 'gj', 'j')
map('n', 'k', 'gk')
map('n', 'gk', 'k')
map('v', '<leader>s', ':sort<cr>')
map('x', '<leader>p', '\"_dP')
map('n', 'q:', '<nop>')

map('n', '<leader>rr', require("genf.asyncrun").asyncrun)
map('n', '<leader>rs', require("genf.asyncrun").asyncstop)

-- Dap
map('n', '<leader>db', require "dap".continue)
map('n', '<leader>dn', require "dap".continue)
map('n', '<leader>ds', require "dap".step_over)
map('n', '<leader>di', require "dap".step_into)
map('n', '<leader>dd', require "dap".toggle_breakpoint)
map('n', '<leader>dD', function() require "dap".set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
map('n', '<leader>dp', function() require "dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
map('n', '<leader>dr', require "dap".repl.open)
map('n', '<leader>dl', require "dap".run_last)

-- GitSigns
local gs = require "gitsigns"
map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
map('n', '<leader>hS', gs.stage_buffer)
map('n', '<leader>hu', gs.undo_stage_hunk)
map('n', '<leader>hR', gs.reset_buffer)
map('n', '<leader>hp', gs.preview_hunk)
map('n', '<leader>hb', function() gs.blame_line { full = true } end)
map('n', '<leader>tb', gs.toggle_current_line_blame)
map('n', '<leader>hd', gs.diffthis)
map('n', '<leader>hD', function() gs.diffthis('~') end)
map('n', '<leader>td', gs.toggle_deleted)

-- stylua: ignore end
