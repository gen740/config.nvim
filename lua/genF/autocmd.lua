M = {}

M.setup = function()
    local function change_color()
        vim.api.nvim_set_hl(0, "Normal", { bg = nil })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#222222" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = nil })
        vim.api.nvim_set_hl(0, "NormalSB", { bg = nil })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = nil })
        vim.api.nvim_set_hl(0, "EasyMotionTarget", { fg = "yellow" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = nil, fg = "#5b6282" })
        vim.api.nvim_set_hl(0, "Search", { bg = "#333333", fg = "#ffe37e", bold = true })
        -- autocmd ColorScheme * hi EndOfBuffer guifg=#222222
        -- autocmd ColorScheme * hi VertSplit guibg=none
        -- autocmd ColorScheme * hi GitSignsAdd guifg=lightblue " 9999ff
        -- autocmd ColorScheme * hi CmpDocumentation guibg=none
        -- autocmd ColorScheme * hi CmpDocumentationBorder guibg=none
        -- autocmd ColorScheme * hi GitSignsAdd      guibg=none  guifg=lightblue
        -- autocmd ColorScheme * hi GitSignsAddNr    guibg=none  guifg=lightblue
        -- autocmd ColorScheme * hi GitSignsAddLn    guibg=none  guifg=lightblue
        -- autocmd ColorScheme * hi GitSignsChange   guibg=none  guifg=lightgreen
        -- autocmd ColorScheme * hi GitSignsChangeNr guibg=none  guifg=lightgreen
        -- autocmd ColorScheme * hi GitSignsChangeLn guibg=none  guifg=lightgreen
        -- autocmd ColorScheme * hi NvimTreeNormal guibg=none
        -- autocmd ColorScheme * hi GitSignsDelete   guibg=none  guifg=red
        -- autocmd ColorScheme * hi GitSignsDeleteNr guibg=none  guifg=red
        -- autocmd ColorScheme * hi GitSignsDeleteLn guibg=none  guifg=red
        -- autocmd ColorScheme * hi Substitute guibg=#ffe37e guifg=#192330
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

    vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "BufWinEnter", "FocusGained", "InsertLeave" },
        {
            callback = function()
                vim.opt.cursorline = true
            end
        }
    )

    vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave", "FocusLost", "InsertEnter" },
        {
            callback = function()
                vim.opt.cursorline = false
            end
        }
    )

    vim.api.nvim_create_autocmd({ "TermOpen" },
        {
            callback = function()
                vim.opt.number = false
                vim.opt.relativenumber = false
            end
        }
    )

    -- highight on yank
    vim.api.nvim_create_autocmd({ "TextYankPost" },
        {
            callback = function()
                return (not vim.v.event.visual) and require 'vim.highlight'.on_yank()
            end
        }
    )
end

return M
