local dir_exists = require("genf.utils").dir_exists


if dir_exists("~/.pyenv/versions/neovim-3/bin") then
    vim.g.python3_host_prog = "~/.pyenv/versions/neovim-3/bin/python3"
elseif dir_exists("~/.config/nvim-venv/bin") then
    vim.g.python3_host_prog = "~/.config/nvim-venv/bin/python3"
end

require("genf.plugins")
require("genf.options")
require("genf.keymap")
require("genf.autocmd")
require("genf.statusline")
require("genf.foldingtxt")

vim.g.JpFormatCursorMovedI = 1
