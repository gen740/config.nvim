local function setup()
  vim.g.indentLine_fileTypeExclude = {
    'dashboard',
    'markdown',
    'NvimTree',
    'toggleterm',
    'qf',
  }

  local hl = vim.api.nvim_set_hl
  local hlgroup = vim.api.nvim_create_namespace

  require('indent_blankline').setup {
    buftype_exclude = { 'dashboard', 'markdown', 'NvimTree', 'toggleterm', 'qf' },
    space_char_blankline = ' ',
    char = '▏', -- '▏', '┊', '│', '⎸'
    char_highlight_list = {
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
      'IndentBlanklineIndent1',
      'IndentBlanklineIndent2',
    },
  }
end

return {
  setup = setup,
}
