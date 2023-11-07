vim.api.nvim_create_augroup('CustomColorScheme', { clear = true })
vim.api.nvim_create_augroup('CustomAutocommand', { clear = true })

local color_schemes = {
  Normal = { bg = nil, fg = '#cdcecf' },
  CursorLine = { bg = '#333333' },
  NormalNC = { bg = nil, fg = '#cdcecf' },
  SignColumn = { bg = nil, fg = '#cdcecf' },
  Search = { bg = '#242424', fg = '#eeb75e', bold = true },
  EndOfBuffer = { fg = '#222222' },
  Substitute = { bg = '#ffe37e', fg = '#192330' },
  Folded = { bg = nil, fg = '#71839b' },
  LineNr = { bg = nil, fg = '#5b6282' },
  LineNrAbove = { bg = nil, fg = '#5b6282' },
  LineNrBelow = { bg = nil, fg = '#5b6282' },
  TabLine = { bg = nil, fg = '#6e7790' },
  TabLineSel = { bg = '#303030', fg = '#6e7790', bold = true },
  TabLineFill = { bg = nil, fg = nil },
  WinBar = { bg = nil, fg = '#6e7790', bold = true },
  WinBarNC = { bg = nil, fg = '#393b44' },
  WinBarFileName = { bg = nil, fg = '#6e7790', bold = true, underline = true },
  StatusLine = { bg = '#2a2a2a', fg = '#2a2a2a', bold = false },
  StatusLineNC = { bg = '#2a2a2a', fg = '#2a2a2a', bold = false },
  WinSeparator = { bg = '#2a2a2a', fg = '#2a2a2a', bold = false },
  QuickFixLine = { bg = '#333333', fg = '#cdcecf' },
  LspInlayHint = { bg = nil, fg = '#5b6282' },
  Comment = { fg = '#60728a', italic = false },
  DiagnosticVirtualTextWarn = { fg = '#ebcb8b', bg = nil, undercurl = true },
  DiagnosticVirtualTextError = { fg = '#bf616a', bg = nil, undercurl = true },
}

vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
  group = 'CustomColorScheme',
  callback = function()
    for key, val in pairs(color_schemes) do
      vim.api.nvim_set_hl(0, key, val)
    end
  end,
})

vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  group = 'CustomAutocommand',
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = 'no'
  end,
})

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  group = 'CustomAutocommand',
  callback = function()
    return not vim.v.event.visual and require('vim.highlight').on_yank()
  end,
})
