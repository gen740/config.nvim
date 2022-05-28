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

vim.cmd([[source ~/.config/nvim/foldingtxt.vim]])
vim.cmd([[source ~/.config/nvim/gui.vim]])

vim.cmd([[
    let JpFormatCursorMovedI = 1
]])

-- Disable unused neovim function
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu   = 1
-- vim.g.did_indent_on             = 1
vim.g.do_filetype_lua           = 1
vim.g.did_load_filetypes        = 0
-- vim.g.did_load_ftplugin         = 1
vim.g.loaded_2html_plugin       = 1
vim.g.loaded_gzip               = 1
vim.g.loaded_man                = 1
vim.g.loaded_matchit            = 1
vim.g.loaded_matchparen         = 1
vim.g.loaded_netrwPlugin        = 1
vim.g.loaded_remote_plugins     = 1
vim.g.loaded_shada_plugin       = 1
vim.g.loaded_spellfile_plugin   = 1
vim.g.loaded_tarPlugin          = 1
vim.g.loaded_tutor_mode_plugin  = 1
vim.g.loaded_zipPlugin          = 1
vim.g.skip_loading_mswin        = 1

vim.cmd([[
    function! s:load_plugins()
    endfunction
    autocmd User load_plugins call s:load_plugins()
    function! s:load_plug(timer)
        doautocmd User load_plugins
    endfunction
    call timer_start(300, function("s:load_plug"))
]])

vim.cmd([[
    try
        colo nightfox
    catch
        echo "there is on colorscheme nightfox"
    endtry
]])

vim.defer_fn(function()
    vim.g.EasyMotion_keys = "aoeuidhtnpyfgcrl;qjkxbmwvzuhs" -- This Option is For Dvorak User
    vim.g.EasyMotion_do_mapping = 0
    vim.g.EasyMotion_use_migemo = 1
    vim.g.EasyMotion_startofline = 0

    -- markdown
    vim.g.vim_markdown_math = 1

    -- Ultisnips
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<c-j>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<c-k>"
    vim.g.UltiSnipsEditSplit = "vertical"
    vim.g.matchup_matchparen_offscreen = { method = "popup" }

    -- Set ColorScheme
end, 100
)
