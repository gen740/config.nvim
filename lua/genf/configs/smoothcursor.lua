local function setup()
  require('smoothcursor').setup {
    disable_float_win = true,
    priority = 100,
    autostart = true,
    threshold = 1,
    speed = 18,
    type = 'exp',
    intervals = 22,
    fancy = {
      enable = true,
      head = { cursor = '', texthl = 'SCCursorHead' },
      body = {
        { cursor = '●', texthl = 'SCCursor' },
        { cursor = '●', texthl = 'SCCursor' },
        { cursor = '•', texthl = 'SCCursor' },
        { cursor = '•', texthl = 'SCCursor' },
        { cursor = '∙', texthl = 'SCCursor' },
        { cursor = '∙', texthl = 'SCCursor' },
      },
    },
    -- flyin_effect = 'bottom',
  }
end

return {
  setup = setup,
}
