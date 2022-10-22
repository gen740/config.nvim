local function setup()
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
end

return {
  setup = setup,
}
