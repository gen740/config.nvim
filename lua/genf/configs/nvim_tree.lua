local function setup()
  require('nvim-tree').setup({
    disable_netrw = false,
    hijack_netrw = false,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      debounce_delay = 50,
      icons = {
        hint = '',
        info = '',
        warning = '',
        error = '',
      },
    },
    update_focused_file = {
      enable = false,
      update_cwd = false,
      ignore_list = {},
    },
    system_open = {
      cmd = nil,
      args = {},
    },
    view = {
      width = 29,
      side = 'left',
      mappings = {
        custom_only = false,
        list = {},
      },
    },
  })
end

return {
  setup = setup,
}
