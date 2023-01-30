return {
  'folke/noice.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  config = function()
    require('noice').setup {
      views = {
        mini = {
          win_options = {
            winblend = 0,
          },
        },
      },
      messages = {
        enabled = true, -- enables the Noice messages UI
        view = 'notify', -- default view for messages
        view_error = 'notify', -- view for errors
        view_warn = 'notify', -- view for warnings
        view_history = 'messages', -- view for :messages
        view_search = false, -- 'virtualtext', -- view for search count messages. Set to `false` to disable
      },
      lsp = {
        signature = {
          enabled = false,
        },
      },
    }
  end,
}
