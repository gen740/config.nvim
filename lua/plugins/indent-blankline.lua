return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup {
      char = '▏',
      context_char = '▏',
      show_current_context = false,
      show_current_context_start = false,
      show_trailing_blankline_indent = true,
      space_char_blankline = ' ',
      char_highlight_list = {
        'IndentBlanklineIndent',
        'IndentBlanklineIndent',
        'IndentBlanklineIndent',
        'IndentBlanklineIndent',
        'IndentBlanklineIndent',
        'IndentBlanklineIndent',
        'IndentBlanklineIndent',
        'IndentBlanklineIndent',
        'IndentBlanklineIndent',
        'IndentBlanklineIndent',
      },
    }
  end,
}
