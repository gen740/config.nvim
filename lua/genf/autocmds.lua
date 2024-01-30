vim.api.nvim_create_augroup('CustomColorScheme', { clear = true })
vim.api.nvim_create_augroup('CustomAutocommand', { clear = true })
vim.api.nvim_create_augroup('WinBarLspProgress', { clear = true })
vim.api.nvim_create_augroup('LazyGitTabClose', { clear = true })

local colors = require('tokyonight.colors')

local color_schemes = {
  Normal = { bg = nil, fg = colors.default.fg },
  Folded = { bg = nil, fg = colors.default.fg },
  LineNr = { bg = nil, fg = colors.default.fg_dark },
  LineNrAbove = { bg = nil, fg = colors.default.fg_gutter },
  LineNrBelow = { bg = nil, fg = colors.default.fg_gutter },
  TabLine = { bg = nil, fg = colors.default.fg_dark },

  WinBar = { bg = nil, fg = colors.default.fg, bold = true },
  WinBarNC = { bg = nil, fg = colors.default.fg_gutter },
  WinBarFileName = { bg = nil, fg = colors.default.blue, bold = true, underline = true },
  WinBarFileIcon = { bg = nil, fg = colors.default.orange, bold = true },
  WinBarLspError = { bg = nil, fg = colors.default.red },
  WinBarLspWarn = { bg = nil, fg = colors.default.yellow },
  WinBarLspInfo = { bg = nil, fg = colors.default.blue },
  WinBarLspHint = { bg = nil, fg = colors.default.green },

  WinBarLspProgressDone = { bg = nil, fg = colors.default.green },
  WinBarLspProgress = { bg = nil, fg = colors.default.blue },
  WinSeparator = { bg = colors.default.bg_dark, fg = colors.default.bg_dark },
  StatusLine = { bg = colors.default.bg_dark, fg = colors.default.bg_dark },
  StatusLineNC = { bg = colors.default.bg_dark, fg = colors.default.bg_dark },

  QuickFixLine = { bg = colors.default.bg_dark, fg = colors.default.fg },
  QfFileName = { bg = nil, fg = colors.default.fg },
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
    pcall(function()
      if vim.api.nvim_get_option_value('filetype', { buf = arg.buf }) == 'lazygit' then
        require('genf.lazygit').lazygit_server_stop()
        vim.cmd('bd!')
      end
    end)
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
