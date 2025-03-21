require('blink.cmp').setup {
  completion = {
    menu = {
      draw = {
        columns = { { 'label', 'label_description', gap = 1 } },
      },
    },
    list = {
      selection = {
        preselect = false,
        auto_insert = true,
      },
    },
  },
  signature = {
    enabled = true,
  },
  sources = {
    default = { 'lsp', 'path', 'snippets' },
  },
}
