return {
  ---- FileType Plugins ----------------------------------------------------------------------
  {
    'fuenor/JpFormat.vim',
    ft = { 'text', 'markdown' },
    config = function()
      vim.g.JpFormatCursorMovedI = 1
    end,
  },
}
