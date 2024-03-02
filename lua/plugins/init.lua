--------------------------------------------------------------------------------
---                           Utility Plugins                                ---
--------------------------------------------------------------------------------

---@diagnostic disable:missing-fields
---@type LazyPluginBase[]
return {
  {
    'machakann/vim-sandwich',
    keys = {
      { 'sa', mode = 'n' },
      { 'sd', mode = 'n' },
      { 'sr', mode = 'n' },
      { 'sa', mode = 'v' },
      { 'sd', mode = 'v' },
      { 'sr', mode = 'v' },
    },
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {}
    end,
    keys = { { 'gc', mode = 'n' }, { 'gc', mode = 'v' } },
  },
  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        styles = {
          -- comments = { italic = false },
          keywords = { italic = false },
        },
        on_highlights = function(hl, c)
          hl.Normal = { bg = nil, fg = c.fg }
          hl.NormalSB = { bg = nil, fg = c.fg }
          hl.PreProc = { bg = nil, fg = c.blue }
          hl.SignColumn = { bg = nil, fg = c.fg }
          hl.SignColumnSB = { bg = nil, fg = c.fg }
          hl.Folded = { bg = nil, fg = c.comment }
          hl.LineNr = { bg = nil, fg = c.fg_dark }
          hl.LineNrAbove = { bg = nil, fg = c.fg_gutter }
          hl.LineNrBelow = { bg = nil, fg = c.fg_gutter }
          hl.WinBar = { bg = nil, fg = c.fg, bold = true }
          hl.WinBarNC = { bg = nil, fg = c.fg_gutter }
          hl.WinBarFileName = { bg = nil, fg = c.blue, bold = true, underline = true }
          hl.WinBarFileIcon = { bg = nil, fg = c.orange, bold = true }
          hl.WinBarLspError = { bg = nil, fg = c.red }
          hl.WinBarLspWarn = { bg = nil, fg = c.yellow }
          hl.WinBarLspInfo = { bg = nil, fg = c.blue }
          hl.WinBarLspHint = { bg = nil, fg = c.green }
          hl.WinBarLspProgressDone = { bg = nil, fg = c.green }
          hl.WinBarLspProgress = { bg = nil, fg = c.blue }
          hl.WinSeparator = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TabLine = { bg = nil, fg = c.fg_dark }
          hl.TabLineFill = { bg = nil, fg = c.fg_dark }
          hl.StatusLine = { bg = c.bg_dark, fg = c.bg_dark }
          hl.StatusLineNC = { bg = c.bg_dark, fg = c.bg_dark }
          hl.QfFileName = { bg = nil, fg = c.orange, bold = true }
          hl.QfLineNr = { bg = nil, fg = c.blue }
        end,
      }
    end,
  },
}
