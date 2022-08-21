local aucmd = vim.api.nvim_create_autocmd
local auproup = vim.api.nvim_create_augroup
local hl = vim.api.nvim_set_hl
local hlgroup = vim.api.nvim_create_namespace

local function change_color()
    hl(0, "Normal", { bg = nil, fg = "#cdcecf" })
    hl(0, "CursorLine", { bg = "#222222" })
    hl(0, "NormalNC", { bg = nil, fg = "#cdcecf" })
    hl(0, "NormalSB", { bg = nil, fg = "#cdcecf" })
    -- hl(0, "NormalFloat", { bg = nil, fg = "#cdcecf" })
    hl(0, "SignColumn", { bg = nil, fg = "#cdcecf" })
    hl(0, "EasyMotionTarget", { fg = "yellow" })
    hl(0, "LineNr", { bg = nil, fg = "#5b6282" })
    hl(0, "Search", { bg = "#333333", fg = "#ffe37e", bold = true })
    hl(0, "EndOfBuffer", { fg = "#222222" })
    hl(0, "GitSignsAdd", { bg = nil, fg = "lightblue" })
    hl(0, "GitSignsAddNr", { bg = nil, fg = "lightblue" })
    hl(0, "GitSignsAddLn", { bg = nil, fg = "lightblue" })
    hl(0, "GitSignsChange", { bg = nil, fg = "lightgreen" })
    hl(0, "GitSignsChangeNr", { bg = nil, fg = "lightgreen" })
    hl(0, "GitSignsChangeLn", { bg = nil, fg = "lightgreen" })
    hl(0, "GitSignsDelete", { bg = nil, fg = "red" })
    hl(0, "GitSignsDeleteNr", { bg = nil, fg = "red" })
    hl(0, "GitSignsDeleteLn", { bg = nil, fg = "red" })
    hl(0, "NvimTreeNormal", { bg = nil, fg = "#cdcecf" })
    hl(0, "TelescopeNormal", { bg = nil, fg = "#cdcecf" })
    hl(0, "Substitute", { bg = "#ffe37e", fg = "#192330" })
    hl(0, "Folded", { bg = nil, fg = "#71839b" })
    hl(0, "LineNrAbove", { bg = nil, fg = "#5b6282" })
    hl(0, "LineNrBelow", { bg = nil, fg = "#5b6282" })
    hl(0, "LineNr", { bg = nil, fg = "yellow" })
    hl(0, "WinBar", { bg = nil, fg = "#719cd6" })
    hl(0, "WinBarNC", { bg = nil, fg = "#393b44" })
    hl(0, "WinSeparator", { bg = nil, fg = "#81b29a" })
    hl(0, "VertSplit", { bg = nil, fg = "#81b29a" })
    hl(0, "StatusLine", { fg = "#cdcecf", bg = nil })

    -- Indent Blankline
    hlgroup("IndentBlanklineIndent1")
    hl(0, "IndentBlanklineIndent1", { bg = nil, fg = "#373354", blend = 0 })
    hlgroup("IndentBlanklineIndent2")
    hl(0, "IndentBlanklineIndent2", { bg = nil, fg = "#232136", blend = 0 })
end

auproup("CustomColorScheme", { clear = true })

aucmd({ "ColorScheme" }, {
    group = "CustomColorScheme",
    callback = change_color
})

aucmd({ "TermOpen" }, {
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})

aucmd({ "TextYankPost" }, {
    callback = function()
        return (not vim.v.event.visual) and require 'vim.highlight'.on_yank()
    end
})

--
-- aucmd({ "VimEnter" }, {
--     callback = function()
--         vim.cmd([[AsyncStop | AsyncRun mpv ~/.config/nvim/audio/001_ずんだもん（ノーマル）_お帰りなさい\ ご主….wav]])
--     end
-- })
--
-- aucmd({ "VimLeavePre" }, {
--     callback = function()
--         vim.cmd([[AsyncStop | !mpv ~/.config/nvim/audio/007_ずんだもん（ノーマル）_さようなら、またき….wav]])
--     end
-- })
--
-- aucmd({ "InsertEnter" }, {
--     callback = function()
--         vim.cmd([[AsyncStop |  AsyncRun mpv ~/.config/nvim/audio/006_ずんだもん（ノーマル）_インサート.wav]])
--     end
-- })
--
-- aucmd({ "InsertLeave" }, {
--     callback = function()
--         vim.cmd([[AsyncStop | AsyncRun mpv ~/.config/nvim/audio/005_ずんだもん（ノーマル）_ノーマル.wav]])
--     end
-- })
--
-- aucmd({ "BufWrite" }, {
--     callback = function()
--         vim.cmd([[AsyncStop | AsyncRun mpv ~/.config/nvim/audio/008_ずんだもん（ノーマル）_保存したのだ.wav]])
--     end
-- })
--
-- aucmd({ "CursorHoldI" }, {
--     callback = function()
--         vim.cmd([[AsyncStop | AsyncRun mpv ~/.config/nvim/audio/004_ずんだもん（ノーマル）_ご主人様、早く打っ….wav]])
--     end
-- })
