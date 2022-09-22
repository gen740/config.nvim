local function setup()
  require('zen-mode').setup({
    window = {
      backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
      width = 100, -- width of the Zen window
      height = 1, -- height of the Zen window
      options = {
        cursorcolumn = false, -- disable cursor column
        foldcolumn = '0', -- disable fold column
      },
    },
    plugins = {
      options = {
        relativenumber = false,
        ruler = false, -- disables the ruler text in the cmd line area
        showcmd = false, -- disables the command in the last line of the screen
      },
      twilight = { enabled = false }, -- enable to start Twilight when zen mode opens
      gitsigns = { enabled = false }, -- disables git signs
      tmux = { enabled = false }, -- disables the tmux statusline
    },
    on_open = function() end,
    on_close = function() end,
  })
end

return {
  setup = setup,
}
