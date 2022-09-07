local function close_if_exists()
    for idx, val in ipairs(vim.fn.getbufinfo()) do
        if vim.fn.get(vim.fn.split(val.name, '/'), 0, "") == "term:" then
            if (val.variables.ToggleTerm == true) and val.windows[1] ~= nil then
                vim.api.nvim_win_close(val.windows[1], true)
                return "terminal"
            elseif (val.variables.ToggleIpython3 == true) and val.windows[1] ~= nil then
                vim.api.nvim_win_close(val.windows[1], true)
                return "ipython"
            end
        end
    end
    return ""
end

function ToggleTerminal()
    -- local cur_winheight = vim.fn.getwininfo()[vim.fn.winnr()].height
    local exits_window = close_if_exists()
    if exits_window == "terminal" then
        return
    end
    vim.fn.execute("sp")
    vim.fn.execute("resize" .. tostring(16))
    local toggleterm_buf_found = false
    for idx, val in ipairs(vim.fn.getbufinfo()) do
        if vim.fn.get(vim.fn.split(val.name, '/'), 0, "") == "term:" then
            if val.variables.ToggleTerm == true then
                toggleterm_buf_found = true
                vim.api.nvim_set_current_buf(val.bufnr)
            end
        end
    end
    if not toggleterm_buf_found then
        vim.fn.execute("term")
        vim.fn.execute("setlocal winbar=%=Terminal%=")
    end
    vim.fn.execute("setlocal nonumber")
    vim.fn.execute("setlocal signcolumn=no")
    vim.fn.execute("setlocal ft=ToggleTerm")
    vim.fn.execute("let b:ToggleTerm=v:true")
    if vim.fn.mode() == "n" then
        vim.fn.feedkeys("i")
    end
end

function ToggleIpython3()
    -- local cur_winheight = vim.fn.getwininfo()[vim.fn.winnr()].height
    local exits_window = close_if_exists()
    if exits_window == "ipython" then
        return
    end
    vim.fn.execute("sp")
    vim.fn.execute("resize" .. tostring(16))
    local toggleterm_buf_found = false
    for idx, val in ipairs(vim.fn.getbufinfo()) do
        if vim.fn.get(vim.fn.split(val.name, '/'), 0, "") == "term:" then
            if val.variables.ToggleIpython3 == true then
                toggleterm_buf_found = true
                vim.api.nvim_set_current_buf(val.bufnr)
            end
        end
    end
    if not toggleterm_buf_found then
        vim.fn.execute("term ipython3")
        vim.fn.execute("setlocal winbar=%=Ipython3%=")
    end
    vim.fn.execute("setlocal nonumber")
    vim.fn.execute("setlocal signcolumn=no")
    vim.fn.execute("setlocal ft=ToggleIpython3")
    vim.fn.execute("let b:ToggleIpython3=v:true")
    if vim.fn.mode() == "n" then
        vim.fn.feedkeys("i")
    end
end
