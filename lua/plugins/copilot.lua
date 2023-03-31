return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          -- enabled = false,
          auto_triggar = true,
        },
        -- panel = { enabled = false },
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
