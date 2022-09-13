local tick = 35
local uv = vim.loop

vim.cmd.sign("define smoothcursor text=")
local cursor_timer = uv.new_timer()

local function smoothcursor()
    if vim.b.cursor_row_prev == nil then
        vim.b.cursor_row_prev = 0
    end
    vim.b.cursor_row_now = vim.fn.getcurpos(vim.fn.win_getid())[2]
    vim.b.diff = vim.b.cursor_row_prev - vim.b.cursor_row_now
    if math.abs(vim.b.diff) > 3 then
        cursor_timer:stop()
        local position = vim.b.cursor_row_prev
        local counter = 1
        uv.timer_start(cursor_timer, 0, tick, vim.schedule_wrap(
            function()
                vim.b.cursor_row_now = vim.fn.getcurpos(vim.fn.win_getid())[2]
                vim.b.diff = vim.b.cursor_row_prev - vim.b.cursor_row_now
                vim.b.cursor_row_prev = vim.b.cursor_row_prev
                    - ((vim.b.diff > 0) and math.ceil(vim.b.diff / 4) or math.floor(vim.b.diff / 4))
                vim.cmd.sign(string.format("unplace 1 file=%s", vim.fn.expand("%:p")))
                vim.cmd.sign(string.format("place 1 line=%d name=smoothcursor file=%s",
                    vim.b.cursor_row_prev, vim.fn.expand("%:p")))
                counter = counter + 1
                if counter > 200 or vim.b.diff == 0 then
                    cursor_timer:stop()
                end
            end)
        )
    else
        vim.b.cursor_row_prev = vim.b.cursor_row_now
        vim.cmd(string.format("silent! sign unplace 1 file=%s", vim.fn.expand("%:p")))
        vim.cmd(string.format("silent! sign place 1 line=%d name=smoothcursor file=%s",
            vim.b.cursor_row_now, vim.fn.expand("%:p")))
    end
end

smoothcursor()

vim.api.nvim_create_augroup("TestAutocommand", { clear = true })

vim.api.nvim_create_autocmd({ 'CursorMoved' }, {
    group = "TestAutocommand",
    callback = smoothcursor
})
