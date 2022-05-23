M = {}

function M.nvim_dap()
    local dap = require("dap")
    dap.adapters.lldb = {
        type = "executable",
        command = "/usr/local/opt/llvm/bin/lldb-vscode", -- adjust as needed
        name = "lldb",
    }
    dap.adapters.python = {
        type = "executable",
        command = "/Users/fujimotogen/.pyenv/versions/debugpy/bin/python",
        args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "lldb",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
        },
    }
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
    dap.configurations.python = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}", -- This configuration will launch the current file if used.
            pythonPath = function()
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                    return cwd .. "/venv/bin/python"
                elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                    return cwd .. "/.venv/bin/python"
                else
                    return "/usr/bin/python"
                end
            end,
        },
    }
    vim.api.nvim_set_keymap("n", "<leader>db", [[<cmd>lua require'dap'.continue()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dn", [[<cmd>lua require'dap'.continue()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>ds", [[<cmd>lua require'dap'.step_over()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>di", [[<cmd>lua require'dap'.step_into()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dd", [[<cmd>lua require'dap'.toggle_breakpoint()<cr>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dD", [[<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dp", [[<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dr", [[<cmd>lua require'dap'.repl.open()<CR>:wincmd h<cr>:set]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>dl", [[<cmd>lua require'dap'.run_last()<CR>]], { noremap = true, silent = true })
end

function Dap_Setup()
    vim.cmd([[autocmd FileType dap-repl setlocal nobuflisted]])
    require("dap").continue()
    vim.fn.feedkeys(":only\n", "x")
    local cur_win = vim.api.nvim_get_current_win()
    local cur_win_height = vim.api.nvim_win_get_height(cur_win)
    local widgets = require("dap.ui.widgets")
    local my_sidebar = widgets.sidebar(widgets.scopes)
    my_sidebar.open()
    -- my_sidebar = widgets.sidebar(widgets.frames)
    -- my_sidebar.open()
    require("dap").repl.open()
    vim.api.nvim_win_set_height(cur_win, math.floor(cur_win_height * 3 / 4))
end

function Dap_Float()
    local widgets = require("dap.ui.widgets")
    widgets.centered_float(widgets.scopes)
end

function M.dap_ui()
    require("dapui").setup({
        icons = { expanded = "▾", collapsed = "▸" },
        mappings = {
            -- Use a table to apply multiple mappings
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
        },
        sidebar = {
            -- open_on_start = true,
            elements = {
                { id = "scopes", size = 0.33 },
                { id = "breakpoints", size = 0.33 },
                { id = "stacks", size = 0.33 },
                -- { id = "watches", size = 00.25 },
            },
            size = 40,
            position = "right", -- Can be "left", "right", "top", "bottom"
        },
        tray = {
            -- open_on_start = true,
            elements = { "repl" },
            size = 15,
            position = "bottom", -- Can be "left", "right", "top", "bottom"
        },
        floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        windows = { indent = 1 },
    })

    local dap, dapui = require("dap"), require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
end

return M
