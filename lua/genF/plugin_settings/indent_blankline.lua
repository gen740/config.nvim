-- bg0     = "#191726", -- Dark bg (status line and float)
-- bg1     = "#232136", -- Default bg
-- bg2     = "#2d2a45", -- Lighter bg (colorcolm folds)
-- bg3     = "#373354", -- Lighter bg (cursor line)
-- bg4     = "#4b4673", -- Conceal, border fg
vim.cmd([[autocmd FileType * highlight IndentBlanklineIndent1 guifg=#373354 blend=nocombine]])
vim.cmd([[autocmd FileType * highlight IndentBlanklineIndent2 guifg=#232136 blend=nocombine]])
vim.cmd([[autocmd FileType * highlight IndentBlanklineBlue guifg=#458588 blend=nocombine]])
vim.cmd([[autocmd FileType * highlight IndentBlanklinePurple guifg=#b16286 blend=nocombine]])
vim.cmd([[autocmd FileType * highlight IndentBlanklineAqua guifg=#a381ff blend=nocombine]])
vim.cmd([[autocmd FileType * highlight IndentBlanklineRed guifg=#719cd6 blend=nocombine]])
vim.cmd([[autocmd FileType * highlight IndentBlanklineOrange guifg=#fe8019 blend=nocombine]])
vim.cmd([[autocmd FileType * highlight IndentBlanklineGreen guifg=#98971a blend=nocombine]])
vim.cmd([[autocmd FileType * highlight IndentBlanklineGray guifg=#928374 blend=nocombine]])

vim.g.indentLine_fileTypeExclude = {
    "dashboard",
    "markdown",
    "NvimTree",
    "toggleterm",
    "qf"
}
-- vim.g.indent_blankline_use_treesitter = true
-- vim.g.indent_blankline_show_current_context = true
-- vim.g.indent_blankline_context_patterns = {
--     "^if", "argument_list", "array", "arrow_function",
--     "block", "case_statement", "class", "dictionary",
--     "dictionnary", "element", "enum_body", "enum_item",
--     "environment", "except", "for", "func_literal",
--     "function", "import", "method", "object",
--     "switch_statement", "table", "try", "while", "with",
-- }
vim.g.indent_blankline_context_highlight_list = {
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
    "IndentBlanklineAqua",
}
require("indent_blankline").setup({
    buftype_exclude = { "dashboard", "markdown", "NvimTree", "toggleterm", "qf" },
    space_char_blankline = " ",
    char = "▏", -- '▏', '┊', '│', '⎸'
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
})
