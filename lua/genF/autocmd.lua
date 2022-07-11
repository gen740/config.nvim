local function change_color()
    vim.api.nvim_set_hl(0, "Normal", { bg = nil, fg = "#cdcecf" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = nil, fg = "#cdcecf" })
    vim.api.nvim_set_hl(0, "NormalSB", { bg = nil, fg = "#cdcecf" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil, fg = "#cdcecf" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = nil, fg = "#cdcecf" })
    vim.api.nvim_set_hl(0, "EasyMotionTarget", { fg = "yellow" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = nil, fg = "#5b6282" })
    vim.api.nvim_set_hl(0, "Search", { bg = "#333333", fg = "#ffe37e", bold = true })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#222222" })
    vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = nil, fg = "lightblue" })
    vim.api.nvim_set_hl(0, "GitSignsAddNr", { bg = nil, fg = "lightblue" })
    vim.api.nvim_set_hl(0, "GitSignsAddLn", { bg = nil, fg = "lightblue" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { bg = nil, fg = "lightgreen" })
    vim.api.nvim_set_hl(0, "GitSignsChangeNr", { bg = nil, fg = "lightgreen" })
    vim.api.nvim_set_hl(0, "GitSignsChangeLn", { bg = nil, fg = "lightgreen" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = nil, fg = "red" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { bg = nil, fg = "red" })
    vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { bg = nil, fg = "red" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = nil, fg = "#cdcecf" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = nil, fg = "#cdcecf" })
    vim.api.nvim_set_hl(0, "Substitute", { bg = "#ffe37e", fg = "#192330" })
    vim.api.nvim_set_hl(0, "Folded", { bg = nil, fg = "#71839b" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { bg = nil, fg = "#5b6282" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { bg = nil, fg = "#5b6282" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = nil, fg = "yellow" })
    vim.api.nvim_set_hl(0, "WinBar", { bg = nil, fg = "#719cd6" })
    vim.api.nvim_set_hl(0, "WinBarNC", { bg = nil, fg = "#393b44" })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = "#cdcecf", bg = nil })
    -- vim.api.nvim_set_hl(0, "FidgetTask", { bg = nil, fg = "#ffffff" })
    -- vim.api.nvim_set_hl(0, "FidgetTitle", { bg = nil, fg = "#ffffff" })
    -- autocmd ColorScheme * hi CmpDocumentation guibg=none
    -- autocmd ColorScheme * hi CmpDocumentationBorder guibg=none
    -- autocmd ColorScheme * hi DiagnosticUnderlineError guibg=#303230 gui=none
    -- autocmd ColorScheme * hi DiagnosticUnderlineWarn guibg=#303230 gui=none
end

vim.api.nvim_create_augroup("CustomColorScheme", {
    clear = true
})

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    group = "CustomColorScheme",
    callback = change_color
})

vim.api.nvim_create_autocmd({ "TermOpen" },
    {
        callback = function()
            vim.opt.number = false
            vim.opt.relativenumber = false
        end
    }
)

vim.api.nvim_create_autocmd({ "TextYankPost" },
    {
        callback = function()
            return (not vim.v.event.visual) and require 'vim.highlight'.on_yank()
        end
    }
)

-- vim.api.nvim_create_autocmd({ "BufNew", "BufEnter" },
--     {
--         pattern = { "quickfix" },
--         callback = function()
--             vim.bo.winbar = ""
--         end
--     }
-- )
