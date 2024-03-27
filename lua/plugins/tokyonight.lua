return {
  'folke/tokyonight.nvim',
  config = function()
    require('tokyonight').setup {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_highlights = function(hl, colors)
        hl.Normal = { bg = nil, fg = colors.fg }
        hl.NormalNC = { bg = nil, fg = colors.fg }
        hl.TelescopeNormal = { bg = colors.bg, fg = colors.fg }
        hl.PreProc = { bg = nil, fg = colors.blue }
        hl.SignColumn = { bg = nil, fg = colors.fg }
        hl.SignColumnSB = { bg = nil, fg = colors.fg }
        hl.Folded = { bg = nil, fg = colors.comment }
        hl.LineNr = { bg = nil, fg = colors.fg_dark }
        hl.LineNrAbove = { bg = nil, fg = colors.fg_gutter }
        hl.LineNrBelow = { bg = nil, fg = colors.fg_gutter }
        hl.WinBar = { bg = nil, fg = colors.fg, bold = true }
        hl.WinBarNC = { bg = nil, fg = colors.fg_gutter }
        hl.WinBarFileName = { bg = nil, fg = colors.blue, bold = true, underline = true }
        hl.WinBarFileIcon = { bg = nil, fg = colors.orange, bold = true }
        hl.WinBarLspError = { bg = nil, fg = colors.red }
        hl.WinBarLspWarn = { bg = nil, fg = colors.yellow }
        hl.WinBarLspInfo = { bg = nil, fg = colors.blue }
        hl.WinBarLspHint = { bg = nil, fg = colors.green }
        hl.WinBarLspProgressDone = { bg = nil, fg = colors.green }
        hl.WinBarLspProgress = { bg = nil, fg = colors.blue }
        hl.WinSeparator = { bg = colors.fg_gutter, fg = colors.bg_dark }
        hl.TabLine = { bg = nil, fg = colors.fg_dark }
        hl.TabLineFill = { bg = nil, fg = colors.fg_dark }
        hl.StatusLine = { bg = colors.fg_gutter, fg = colors.bg_dark }
        hl.StatusLineNC = { bg = colors.fg_gutter, fg = colors.bg_dark }
        hl.QfFileName = { bg = nil, fg = colors.orange, bold = true }
        hl.QfLineNr = { bg = nil, fg = colors.blue }
      end,
    }
  end,
}
