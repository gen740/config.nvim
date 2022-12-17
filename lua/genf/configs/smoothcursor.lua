local function setup()
  require('smoothcursor').setup {
    priority = 1,
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
  }
end

return {
  setup = setup,
}
