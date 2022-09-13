vim.g.mapleader = [[ ]]
local keymap = function(mode, key, cmd)
    vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true })
end

-- stylua: ignore start
keymap('n', '<c-q>', '<cmd>NvimTreeToggle<cr>')
keymap('n', '<m-j>', '<cmd>resize +2<cr>')
keymap('n', '<m-h>', '<cmd>vertical resize -2<cr>')
keymap('n', '<m-l>', '<cmd>vertical resize +2<cr>')
keymap('n', '<m-k>', '<cmd>resize -2<cr>')
keymap('n', '<m-n>', '<cmd>cn<cr>')

keymap('n', '<m-q>', '<cmd>lua require("genf.toggleshell").toggleqfwin()<cr>')
keymap('t', '<m-q>', '<cmd>lua require("genf.toggleshell").toggleqfwin()<cr>')
keymap('n', '<m-w>', '<cmd>lua require("genf.toggleshell").toggleterm()<cr>')
keymap('t', '<m-w>', '<cmd>lua require("genf.toggleshell").toggleterm()<cr>')
keymap('n', '<m-p>', '<cmd>lua require("genf.toggleshell").toggleipython3()<cr>')
keymap('t', '<m-p>', '<cmd>lua require("genf.toggleshell").toggleipython3()<cr>')
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
keymap('n', '<leader>db', '<cmd>lua require"dap".continue()<cr>')
keymap('n', '<leader>dn', '<cmd>lua require"dap".continue()<cr>')
keymap('n', '<leader>ds', '<cmd>lua require"dap".step_over()<cr>')
keymap('n', '<leader>di', '<cmd>lua require"dap".step_into()<cr>')
keymap('n', '<leader>dd', '<cmd>lua require"dap".toggle_breakpoint()<cr>')
keymap('n', '<leader>dD', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
keymap('n', '<leader>dp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>:wincmd h<cr>:set')
keymap('n', '<leader>dl', '<cmd>lua require"dap".run_last()<CR>')


-- stylua: ignore end
