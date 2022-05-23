-- ┼─────────────────────────────────────────────────────────────────┼
-- │ {{{                   « Key mappings »                          │
-- ┼─────────────────────────────────────────────────────────────────┼

M = {}

M.setup = function()
    vim.cmd([[let mapleader = "\<Space>"]])

    -- stylua: ignore start
    vim.api.nvim_set_keymap("n", "<c-n>", "<cmd>BufferLineCycleNext<cr>", { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "<c-p>", "<cmd>BufferLineCyclePrev<cr>", { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "<c-q>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

    vim.api.nvim_set_keymap("n", "<m-j>", "<cmd>resize +2<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<m-h>", "<cmd>vertical resize -2<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<m-l>", "<cmd>vertical resize +2<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<m-k>", "<cmd>resize -2<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<m-n>", "<cmd>cn<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<m-p>", "<cmd>co<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<m-w>", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>copen<cr>", { noremap = true, silent = true })

    vim.api.nvim_set_keymap("n", "<leader>tcb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>Telescope git_branches<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>Telescope git_files<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>Telescope file_browser<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>tl", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>ts", ":Telescope", { noremap = false, silent = false })

    vim.api.nvim_set_keymap("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>", { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>bn", "<cmd>BufferLineMoveNext<cr>", { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>bp", "<cmd>BufferLineMovePrev<cr>", { noremap = false, silent = true })

    vim.api.nvim_set_keymap("n", "<leader>ut", "<cmd>UndotreeToggle<cr>", { noremap = true, silent = true })

    vim.api.nvim_set_keymap("n", "S", "<Plug>(easymotion-overwin-line)", { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>s", "<Plug>(easymotion-overwin-f2)", { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "f", "<Plug>Sneak_s", { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "F", "<Plug>Sneak_S", { noremap = false, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>ZenMode<cr>", { noremap = false, silent = true })

    vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "gj", "j", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "gk", "k", { noremap = true, silent = true })

    vim.api.nvim_set_keymap("t", "<m-b>", [[<c-\><c-n>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<leader>s", ":sort<cr>", { noremap = true, silent = true })

    vim.api.nvim_set_keymap('n', 'q:', [[<nop>]], { noremap = true, silent = true })
    -- stylua: ignore end
end

return M
