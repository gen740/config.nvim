-- Search for python3
local function dir_exists(path)
    if type(path) ~= 'string' then
        error('input error')
        return false
    end
    local response = os.execute('cd ' .. path .. ' 2> /dev/null')
    if response == 0 or response == true then
        return true
    end
    return false
end

if dir_exists("~/.pyenv/versions/neovim-3/bin") then
    vim.g.python3_host_prog = "~/.pyenv/versions/neovim-3/bin/python3"
elseif dir_exists("~/.config/nvim-venv/bin") then
    vim.g.python3_host_prog = "~/.config/nvim-venv/bin/python3"
end

require("genF.options")
require("genF.keymap")
require("genF.autocmd")
require("genF.plugins")
require("genF.statusline")
require("genF.foldingtxt")

vim.cmd([[
    try
        colo nightfox
    catch
        echo "there is on colorscheme nightfox"
    endtry
    let JpFormatCursorMovedI = 1
]])
