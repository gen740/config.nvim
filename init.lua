require("genF.init")
require("genF.plugins")

vim.cmd([[source ~/.config/nvim/foldingtxt.vim]])
vim.cmd([[source ~/.config/nvim/gui.vim]])

vim.cmd([[
    let JpFormatCursorMovedI = 1
]])
