M = {}

function M.marks()
  require('marks').setup({
    default_mappings = false,
    builtin_marks = { '.', '<', '>', '^' },
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 250,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    excluded_filetypes = {},
    bookmark_0 = {
      sign = '⚑',
      virt_text = '',
      annotate = false,
    },
    mappings = {},
  })
end

return M
