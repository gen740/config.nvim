require('blink.cmp').setup {
  keymap = {
    preset = 'default',
  },
  completion = {
    menu = {
      draw = {
        columns = { { 'label', 'label_description', gap = 1 } },
      },
    },
  },
  signature = {
    enabled = true,
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
}
