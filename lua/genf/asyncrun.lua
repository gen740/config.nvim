local M = {}

local running_jobid = nil
local is_running = false
local previous_cmd = nil

---@param cmd nil|string
function M.asyncrun(cmd)
    -- Repeat if argument is nil
    if cmd == nil then
        cmd = previous_cmd
    end
    previous_cmd = cmd

    local lines = {}
    local winnr = vim.fn.win_getid()
    local bufnr = vim.api.nvim_win_get_buf(winnr)
    local qfwinid = vim.fn.getqflist({ winid = winnr }).winid

    if is_running then
        print("Command still runing")
        return
    else
        is_running = true
    end

    local efm = vim.api.nvim_buf_get_option(bufnr, "efm")
    if efm == nil or efm == "" then
        efm = '%f:%l:%c:%m,%f:%l:%m'
    end

    vim.fn.setqflist({}, " ", {
        title = cmd,
        lines = {},
        efm = efm
    })

    local function on_event(job_id, data, event)
        if event == "stdout" or event == "stderr" then
            if data then
                for idx, val in ipairs(data) do
                    print(val)
                    if val ~= "" then
                        vim.list_extend(lines, { val })
                    end
                end
                vim.fn.setqflist({}, " ", {
                    title = cmd,
                    lines = lines,
                    efm = efm
                })
                -- vim.api.nvim_command("doautocmd QuickFixCmdPost")
            end
        end
        if event == "exit" then
            vim.api.nvim_command("doautocmd QuickFixCmdPost")
            print("Done")
            is_running = false
            running_jobid = nil
        end
    end

    running_jobid = vim.fn.jobstart(
        cmd,
        {
            on_stderr = on_event,
            on_stdout = on_event,
            on_exit = on_event,
            stdout_buffered = false,
            stderr_buffered = false,
        }
    )
end

function M.ripgrep(cmd)
    local lines = {}
    local winnr = vim.fn.win_getid()
    local bufnr = vim.api.nvim_win_get_buf(winnr)
    local qfwinid = vim.fn.getqflist({ winid = winnr }).winid

    if is_running then
        print("Command still runing")
        return
    else
        is_running = true
    end

    local efm = vim.api.nvim_buf_get_option(bufnr, "efm")
    if efm == nil or efm == "" then
        efm = '%f:%l:%c:%m,%f:%l:%m'
    end

    vim.fn.setqflist({}, " ", {
        title = cmd,
        lines = {},
        efm = efm
    })

    local function on_event(job_id, data, event)
        if event == "stdout" or event == "stderr" then
            if data then
                for idx, val in ipairs(data) do
                    print(val)
                    if val ~= "" then
                        vim.list_extend(lines, { val })
                    end
                end
                vim.fn.setqflist({}, " ", {
                    title = cmd,
                    lines = lines,
                    efm = efm
                })
                -- vim.api.nvim_command("doautocmd QuickFixCmdPost")
            end
        end
        if event == "exit" then
            vim.api.nvim_command("doautocmd QuickFixCmdPost")
            print("Done")
            is_running = false
            running_jobid = nil
        end
    end

    running_jobid = vim.fn.jobstart(
        cmd,
        {
            on_stderr = on_event,
            on_stdout = on_event,
            on_exit = on_event,
            stdout_buffered = false,
            stderr_buffered = false,
        }
    )
end

function M.asyncstop()
    if running_jobid then
        vim.fn.jobstop(running_jobid)
    end
end

local function get_quickfix_buf()
    local winnr = vim.fn.win_getid()
    local bufnr = vim.api.nvim_win_get_buf(winnr)
    local qfwinid = vim.fn.getqflist({ winid = winnr }).winid

    vim.fn.setqflist({}, " ", {
        title = "Test",
        lines = {
            "hoge",
            "fuga",
            "piyo",
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
        },
    })
    vim.api.nvim_win_call(qfwinid,
        function()
            -- vim.api.nvim_win_set_cursor(qfwinid, { 0, 0 })
            -- print("hello")
            vim.cmd [[:norm G]]
        end
    )
    -- print(vim.api.nvim_win_get_cursor(1000)[1])
end

get_quickfix_buf()


return M
