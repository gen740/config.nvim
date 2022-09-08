local M = {}

local running_jobid = nil
local is_running = false

function M.asyncrun(cmd)
    local lines = {}
    local winnr = vim.fn.win_getid()
    local bufnr = vim.api.nvim_win_get_buf(winnr)

    if is_running then
        print("Command still runing")
        return
    else
        is_running = true
    end

    local efm = vim.api.nvim_buf_get_option(bufnr, "efm")
    if efm == nil or efm == "" then
        print("Plese set error format")
    end

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

return M
