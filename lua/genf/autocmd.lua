local hlcolors = {
  Normal = { bg = nil, fg = '#cdcecf' },
  CursorLine = { bg = '#333333' },
  NormalNC = { bg = nil, fg = '#cdcecf' },
  NormalSB = { bg = nil, fg = '#cdcecf' },
  SignColumn = { bg = nil, fg = '#cdcecf' },
  EasyMotionTarget = { fg = 'yellow' },
  LineNr = { bg = nil, fg = '#5b6282' },
  Search = { bg = '#242424', fg = '#eeb75e', bold = true },
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
  WinBar = { bg = nil, fg = '#6e7790', bold = true },
  WinBarNC = { bg = nil, fg = '#393b44' },
  WinBarFileName = { bg = nil, fg = '#6e7790', bold = true, underline = true },
  WhiteSpace = { fg = '#444c53' },
  -- StatusLine = { bg = nil, fg = '#6e7790', bold = false },
  -- StatusLineContent = { bg = nil, fg = '#6e7790', bold = false, underline = true },
  StatusLine = { bg = '#2a2a2a', fg = '#2a2a2a', bold = false },
  StatusLineNC = { bg = '#2a2a2a', fg = '#2a2a2a', bold = false },
  -- WinSeparator = { bg = nil, fg = '#81b29a' },
  WinSeparator = { bg = '#2a2a2a', fg = '#2a2a2a', bold = false },
  QuickFixLine = { bg = '#333333', fg = '#cdcecf' },
  LspInlayHint = { bg = nil, fg = '#5b6282' },
  SmoothCursor = { bg = nil, fg = '#8aa872' },
  SmoothCursorBody = { bg = nil, fg = '#8aa872' },
  Comment = { fg = '#60728a', italic = false },
  NoiceLspProgressClient = { fg = '#8cabd2', bg = nil, undercurl = false },
  NoiceLspProgressSpinner = { fg = '#d89079', bg = nil, undercurl = false },
  NoiceLspProgressTitle = { fg = '#5a657d', bg = nil, undercurl = false },
  NoiceFormatProgressDone = { fg = '#5a657d', bg = nil, undercurl = false },
  NoiceFormatProgressTodo = { fg = '#5a657d', bg = nil, undercurl = false },
  NoiceMini = { fg = '#60728a', bg = nil },
  NoicePopup = { fg = '#60728a', bg = nil },
  DiagnosticVirtualTextWarn = { fg = '#ebcb8b', bg = nil, undercurl = true },
  DiagnosticVirtualTextError = { fg = '#bf616a', bg = nil, undercurl = true },
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
augroup('CustomAutocommand', { clear = true })

autocmd({ 'ColorScheme' }, {
  group = 'CustomColorScheme',
  callback = change_color,
})

autocmd({ 'TermOpen' }, {
  group = 'CustomAutocommand',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end,
})

autocmd({ 'TextYankPost' }, {
  group = 'CustomAutocommand',
  callback = function()
    return not vim.v.event.visual and require('vim.highlight').on_yank()
  end,
})
