local function setup()
  require('gitsigns').setup({
    signs = {
      add = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
      change = {
        hl = 'GitSignsChange',
        text = '│',
        numhl = 'GitSignsChangeNr',
        linehl = 'GitSignsChangeLn',
      },
      delete = {
        hl = 'GitSignsDelete',
        text = '_',
        numhl = 'GitSignsDeleteNr',
        linehl = 'GitSignsDeleteLn',
      },
      topdelete = {
        hl = 'GitSignsDelete',
        text = '‾',
        numhl = 'GitSignsDeleteNr',
        linehl = 'GitSignsDeleteLn',
      },
      changedelete = {
        hl = 'GitSignsChange',
        text = '~',
        numhl = 'GitSignsChangeNr',
        linehl = 'GitSignsChangeLn',
      },
    },
    numhl = true,
    linehl = false,
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,
      ['n ]c'] = {
        expr = true,
        "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'",
      },
      ['n [c'] = {
        expr = true,
        "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'",
      },
      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<cr>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<cr>',
      -- text objects
      ['o ih'] = ':<c-u>lua require"gitsigns.actions".select_hunk()<cr>',
      ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    sign_priority = 6,
    update_debounce = 1000,
    status_formatter = nil, -- Use default
    word_diff = false,
  })
end

return {
  setup = setup,
}
