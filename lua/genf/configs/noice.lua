local function setup()
  require('noice').setup {
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
    lsp = {
      signature = {
        enabled = false,
      },
    },
  }
end

return {
  setup = setup,
}
