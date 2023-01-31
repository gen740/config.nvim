return {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup {
      -- for example, context is off by default, use this to turn it on
      show_current_context = true,
      show_current_context_start = true,
      char = '▏',
      context_char = '▏',
      space_char_blankline = ' ',
      char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent1',
      },
    }
  end,
}
