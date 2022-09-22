vim.api.nvim_create_namespace('IndentBlanklineIndent1')
vim.api.nvim_create_namespace('IndentBlanklineIndent2')

local hlcolors = {
  Normal = { bg = nil, fg = '#cdcecf' },
  CursorLine = { bg = '#222222' },
  NormalNC = { bg = nil, fg = '#cdcecf' },
  NormalSB = { bg = nil, fg = '#cdcecf' },
  SignColumn = { bg = nil, fg = '#cdcecf' },
  EasyMotionTarget = { fg = 'yellow' },
  LineNr = { bg = nil, fg = '#5b6282' },
  -- LineNr = { bg = nil, fg = 'yellow' },
  Search = { bg = '#333333', fg = '#ffe37e', bold = true },
  EndOfBuffer = { fg = '#222222' },
  GitSignsAdd = { bg = nil, fg = 'lightblue' },
  GitSignsAddNr = { bg = nil, fg = 'lightblue' },
  GitSignsAddLn = { bg = nil, fg = 'lightblue' },
  GitSignsChange = { bg = nil, fg = 'lightgreen' },
  GitSignsChangeNr = { bg = nil, fg = 'lightgreen' },
  GitSignsChangeLn = { bg = nil, fg = 'lightgreen' },
  GitSignsDelete = { bg = nil, fg = 'red' },
  GitSignsDeleteNr = { bg = nil, fg = 'red' },
  GitSignsDeleteLn = { bg = nil, fg = 'red' },
  NvimTreeNormal = { bg = nil, fg = '#cdcecf' },
  TelescopeNormal = { bg = nil, fg = '#cdcecf' },
  Substitute = { bg = '#ffe37e', fg = '#192330' },
  Folded = { bg = nil, fg = '#71839b' },
  LineNrAbove = { bg = nil, fg = '#5b6282' },
  LineNrBelow = { bg = nil, fg = '#5b6282' },
  WinBar = { bg = nil, fg = '#719cd6' },
  WinBarNC = { bg = nil, fg = '#393b44' },
  WinSeparator = { bg = nil, fg = '#81b29a' },
  VertSplit = { bg = nil, fg = '#81b29a' },
  StatusLine = { bg = nil, fg = '#cdcecf' },
  QuickFixLine = { bg = '#333333', fg = '#cdcecf' },
  IndentBlanklineIndent1 = { bg = nil, fg = '#474364', blend = 0 },
  IndentBlanklineIndent2 = { bg = nil, fg = '#373354', blend = 0 },
  LspInlayHint = { bg = nil, fg = '#5b6282' },
  SCCursor = { bg = nil, fg = '#858850' },
}

local function change_color()
  for key, val in pairs(hlcolors) do
    vim.api.nvim_set_hl(0, key, val)
  end
end

-- auto Commands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('CustomColorScheme', { clear = true })

autocmd({ 'ColorScheme' }, {
  group = 'CustomColorScheme',
  callback = change_color,
})

autocmd({ 'TermOpen' }, {
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end,
})

autocmd({ 'TextYankPost' }, {
  callback = function()
    return not vim.v.event.visual and require('vim.highlight').on_yank()
  end,
})
