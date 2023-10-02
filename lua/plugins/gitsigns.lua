return {
  'lewis6991/gitsigns.nvim',
  config = function()
    for key, val in pairs {
      GitSignsAdd = { bg = nil, fg = 'lightblue' },
      GitSignsAddNr = { bg = nil, fg = 'lightblue' },
      GitSignsAddLn = { bg = nil, fg = 'lightblue' },
      GitSignsChange = { bg = nil, fg = 'lightgreen' },
      GitSignsChangeNr = { bg = nil, fg = 'lightgreen' },
      GitSignsChangeLn = { bg = nil, fg = 'lightgreen' },
      GitSignsDelete = { bg = nil, fg = 'red' },
      GitSignsDeleteNr = { bg = nil, fg = 'red' },
      GitSignsDeleteLn = { bg = nil, fg = 'red' },
    } do
      vim.api.nvim_set_hl(0, key, val)
    end

    require('gitsigns').setup {
      signs = {
        add = {
          hl = 'GitSignsAdd',
          text = '│',
          numhl = 'GitSignsAddNr',
          linehl = 'GitSignsAddLn',
        },
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
      signcolumn = true,
      numhl = false,
      linehl = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      sign_priority = 6,
      update_debounce = 1000,
      status_formatter = nil, -- Use default
      word_diff = false,
    }
  end,
}
