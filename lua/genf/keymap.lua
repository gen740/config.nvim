vim.g.mapleader = [[ ]]
local keymap = function(mode, key, cmd)
  -- vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true })
  vim.keymap.set(mode, key, cmd, { noremap = true, silent = true })
end

-- stylua: ignore start
keymap('n', '<c-q>', '<cmd>NvimTreeToggle<cr>')
keymap('n', '<m-j>', '<cmd>resize +2<cr>')
keymap('n', '<m-h>', '<cmd>vertical resize -2<cr>')
keymap('n', '<m-l>', '<cmd>vertical resize +2<cr>')
keymap('n', '<m-k>', '<cmd>resize -2<cr>')
keymap('n', '<m-n>', '<cmd>cn<cr>')

keymap('n', '<m-q>', require("genf.toggleshell").toggleqfwin)
keymap('t', '<m-q>', require("genf.toggleshell").toggleqfwin)
keymap('n', '<m-w>', require("genf.toggleshell").toggleterm)
keymap('t', '<m-w>', require("genf.toggleshell").toggleterm)
keymap('n', '<m-p>', require("genf.toggleshell").toggleipython3)
keymap('t', '<m-p>', require("genf.toggleshell").toggleipython3)
keymap('t', '<m-b>', [[<c-\><c-n>]])

keymap('n', '<leader>co', '<cmd>copen<cr><C-w>p')
keymap('n', '<leader>tcb', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
keymap('n', '<leader>tb', '<cmd>Telescope git_branches<cr>')
keymap('n', '<leader>tg', '<cmd>Telescope git_files<cr>')
keymap('n', '<leader>tf', '<cmd>Telescope find_files<cr>')
keymap('n', '<leader>tn', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>tl', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>ts', ':Telescope')
keymap('n', '<leader>ut', '<cmd>UndotreeToggle<cr>')
keymap('n', '<leader>z', '<cmd>ZenMode<cr>')
keymap('n', 'j', 'gj')
keymap('n', 'gj', 'j')
keymap('n', 'k', 'gk')
keymap('n', 'gk', 'k')
keymap('v', '<leader>s', ':sort<cr>')
keymap('x', '<leader>p', '\'_dP')
keymap('n', 'q:', '<nop>')

-- Dap
keymap('n', '<leader>db', require "dap".continue)
keymap('n', '<leader>dn', require "dap".continue)
keymap('n', '<leader>ds', require "dap".step_over)
keymap('n', '<leader>di', require "dap".step_into)
keymap('n', '<leader>dd', require "dap".toggle_breakpoint)
keymap('n', '<leader>dD', function() require "dap".set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
keymap('n', '<leader>dp', function() require "dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
keymap('n', '<leader>dr', require "dap".repl.open)
keymap('n', '<leader>dl', require "dap".run_last)

keymap('n', '<leader>rr', require("genf.asyncrun").asyncrun)
keymap('n', '<leader>rs', require("genf.asyncrun").asyncstop)

-- stylua: ignore end
