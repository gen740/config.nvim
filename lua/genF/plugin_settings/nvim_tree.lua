require("nvim-tree").setup {
    disable_netrw = false,
    hijack_netrw = false,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = false,
    lsp_diagnostics = true,
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
        width = 30,
        side = "left",
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {},
        },
    },
}
