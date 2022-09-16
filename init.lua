local dir_exists = require("genf.utils").dir_exists

if dir_exists("~/.pyenv/versions/neovim-3/bin") then
    vim.g.python3_host_prog = "~/.pyenv/versions/neovim-3/bin/python3"
elseif dir_exists("~/.config/nvim-venv/bin") then
    vim.g.python3_host_prog = "~/.config/nvim-venv/bin/python3"
end

require("genf.options")
require("genf.keymap")
require("genf.autocmd")
require("genf.plugins")
require("genf.statusline")
require("genf.foldingtxt")

vim.opt.runtimepath:append("~/home/Labo/Project/SmoothCursor.nvim")


require('smoothcursor').setup({
    cursor = "▷ ",
    priority = 1,
    intervals = 35,
    speed = 25,
    type = "default",
    fancy = {
        enable = true,
        head = { cursor = "▷", texthl = "SmoothCursorWhite" },
        body = {
            -- { cursor = "", texthl = "SmoothCursor" },
            -- { cursor = "", texthl = "SmoothCursorOrange" },
            -- { cursor = "●", texthl = "SmoothCursorYellow" },
            -- { cursor = "●", texthl = "SmoothCursor" },
            { cursor = "•", texthl = "SmoothCursor" },
            -- { cursor = ".", texthl = "SmoothCursor" },
            { cursor = ".", texthl = "SmoothCursor" },
        },
        -- tail = { cursor = "♡ " },
    }
})


vim.g.JpFormatCursorMovedI = 1
