local function setup()
  require('smoothcursor').setup {
    priority = 1,
    autostart = true,
    threshold = 1,
    speed = 18,
    type = 'exp',
    intervals = 24,
    fancy = {
      enable = true,
      head = { cursor = nil, texthl = 'SCCursor' },
      body = {
        { cursor = '●', texthl = 'SCCursor' },
        { cursor = '•', texthl = 'SCCursor' },
        { cursor = '∙', texthl = 'SCCursor' },
      },
    },
  }
end

return {
  setup = setup,
}
