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

-- vim.api.nvim_create_namespace('SCwhite')
-- vim.api.nvim_set_hl(0, 'SCWhite', { bg = nil, fg = '#dddddd' })


vim.g.JpFormatCursorMovedI = 1



vim.cmd([[:nmap <leader>ss :lua local buf=vim.api.nvim_create_buf(false, true); vim.api.nvim_open_win(buf, true, {relative='win', row=30, col=30, width=100, height=50})<CR>]])
