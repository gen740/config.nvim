local function setup()
  require('noice').setup {
    views = {
      mini = {
        win_options = {
          winblend = 0,
        },
      },
    },
  }
end

return {
  setup = setup,
}
