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

vim.defer_fn(
    function()
        vim.g.EasyMotion_keys = "aoeuidhtnpyfgcrl;qjkxbmwvzuhs" -- This Option is For Dvorak User
        vim.g.EasyMotion_do_mapping = 0
        vim.g.EasyMotion_use_migemo = 1
        vim.g.EasyMotion_startofline = 0

        -- Ultisnips
        vim.g.UltiSnipsExpandTrigger = "<tab>"
        vim.g.UltiSnipsJumpForwardTrigger = "<c-e>"
        vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
        vim.g.UltiSnipsEditSplit = "vertical"
        vim.g.matchup_matchparen_offscreen = { method = "popup" }

        vim.api.nvim_set_hl(0, "FigetTask", { bg = nil, fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "FigetTitle", { bg = nil, fg = "#ffffff" })
        -- Set ColorScheme
    end, 100
)
