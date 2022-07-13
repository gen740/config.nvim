vim.cmd([[let mapleader = "\<Space>"]])

-- stylua: ignore start
local keymap = function(mode, key, cmd)
    vim.api.nvim_set_keymap(mode, key, cmd, { noremap = true, silent = true })
end

keymap("n", "<c-q>",       "<cmd>NvimTreeToggle<cr>")
keymap("n", "<m-j>",       "<cmd>resize +2<cr>")
keymap("n", "<m-h>",       "<cmd>vertical resize -2<cr>")
keymap("n", "<m-l>",       "<cmd>vertical resize +2<cr>")
keymap("n", "<m-k>",       "<cmd>resize -2<cr>")
keymap("n", "<m-n>",       "<cmd>cn<cr>")
keymap("n", "<m-p>",       "<cmd>co<cr>")
keymap("n", "<m-w>",       "<cmd>ToggleTerm<cr>")
keymap("n", "<leader>co",  "<cmd>copen<cr><C-w>p")
keymap("n", "<leader>tcb", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
keymap("n", "<leader>tb",  "<cmd>Telescope git_branches<cr>")
keymap("n", "<leader>tg",  "<cmd>Telescope git_files<cr>")
keymap("n", "<leader>tf",  "<cmd>Telescope find_files<cr>")
keymap("n", "<leader>tn",  "<cmd>Telescope buffers<cr>")
keymap("n", "<leader>tl",  "<cmd>Telescope live_grep<cr>")
keymap("n", "<leader>ts",  ":Telescope")
keymap("n", "<leader>ut",  "<cmd>UndotreeToggle<cr>")
keymap("n", "<leader>z",   "<cmd>ZenMode<cr>")
keymap("n", "j",           "gj")
keymap("n", "gj",          "j")
keymap("n", "k",           "gk")
keymap("n", "gk",          "k")
keymap("t", "<m-b>",       [[<c-\><c-n>]])
keymap("v", "<leader>s",   ":sort<cr>")
keymap('n', 'q:',          [[<nop>]])

-- -- stylua: ignore end
