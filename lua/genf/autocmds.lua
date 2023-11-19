vim.api.nvim_create_augroup('CustomColorScheme', { clear = true })
vim.api.nvim_create_augroup('CustomAutocommand', { clear = true })
vim.api.nvim_create_augroup('WinBarLspProgress', { clear = true })
vim.api.nvim_create_augroup('LazyGitTabClose', { clear = true })

local palette = require('nightfox.palette.nordfox').palette

local color_schemes = {
  -- Normal = { bg = nil, fg = palette.fg1 },
  Normal = { bg = nil, fg = palette.fg1 },
  TelescopeNormal = { bg = '#202020', fg = palette.fg1 },
  TelescopeBorder = { bg = '#202020', fg = palette.fg1 },

  ChatGPTNormal = { bg = '#202020', fg = palette.fg1 },
  ChatGPTPrompt = { bg = '#151515', fg = palette.fg1 },
  ChatGPTBorder = { bg = palette.bg0, fg = palette.fg1 },

  CursorLine = { bg = palette.bg0 },
  NormalNC = { bg = nil, fg = palette.fg1 },
  Search = { bg = palette.bg0, fg = palette.yellow.dim, bold = true },
  Folded = { bg = nil, fg = palette.fg3 },
  LineNr = { bg = nil, fg = palette.fg3 },
  LineNrAbove = { bg = nil, fg = palette.fg3 },
  LineNrBelow = { bg = nil, fg = palette.fg3 },

  TabLine = { bg = nil, fg = palette.fg2 },
  TabLineSel = { bg = palette.bg0, fg = palette.orange.bright, bold = true },
  TabLineFill = { bg = nil, fg = nil },

  WinBar = { bg = nil, fg = '#6e7790', bold = true },
  WinBarNC = { bg = nil, fg = '#393b44' },
  WinBarFileName = { bg = nil, fg = palette.orange.bright, bold = true, underline = true },
  WinBarFileIcon = { bg = nil, fg = palette.orange.dim, bold = true },
  WinBarLspError = { bg = nil, fg = '#bf616a' },
  WinBarLspWarn = { bg = nil, fg = '#ebcb8b' },
  WinBarLspInfo = { bg = nil, fg = '#3f4a5a' },
  WinBarLspHint = { bg = nil, fg = '#a3be8c' },

  WinBarLspProgressDone = { bg = nil, fg = '#ebcb8b' },
  WinBarLspProgress = { bg = nil, fg = '#bf616a' },

  WinSeparator = { bg = palette.bg0, fg = palette.bg0 },
  StatusLine = { bg = palette.bg0, fg = palette.bg0 },
  StatusLineNC = { bg = palette.bg0, fg = palette.bg0 },

  QuickFixLine = { bg = palette.bg0, fg = palette.fg1 },
  LspInlayHint = { bg = nil, fg = '#5b6282' },
  Comment = { fg = palette.comment, italic = false },
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

vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  group = 'CustomAutocommand',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'Search',
    }
  end,
})

vim.api.nvim_create_autocmd({ 'TermClose' }, {
  group = 'LazyGitTabClose',
  callback = function(arg)
    if vim.api.nvim_get_option_value('filetype', { buf = arg.buf }) == 'lazygit' then
      require('genf.lazygit').lazygit_server_stop()
      vim.cmd('bd!')
    end
  end,
})

vim.api.nvim_create_autocmd({ 'LspProgress' }, {
  callback = function(event)
    local kind = event.data.result.value.kind
    if kind == 'begin' then
      ---@type lsp.WorkDoneProgressBegin
      local mes = event.data.result.value
      require('genf.winbar').set_current_progress {
        in_progress = true,
        value = {
          message = mes.message,
          percentage = mes.percentage,
          title = mes.title,
        },
      }
    elseif kind == 'report' then
      ---@type lsp.WorkDoneProgressReport
      local mes = event.data.result.value
      require('genf.winbar').set_current_progress {
        in_progress = true,
        value = {
          message = mes.message,
          percentage = mes.percentage,
        },
      }
    elseif kind == 'end' then
      ---@type lsp.WorkDoneProgressEnd
      require('genf.winbar').set_current_progress {
        in_progress = false,
      }
    end
    vim.cmd('redrawstatus')
  end,
  group = 'WinBarLspProgress',
})
