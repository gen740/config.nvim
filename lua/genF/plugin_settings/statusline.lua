M = {}

function M.lsp_status()
    local lsp_status = require("lsp-status")
    lsp_status.register_progress()
    lsp_status.config({
        status_symbol = " ",
        current_function = true,
    })
end

function M.lualine()
    function Word_count()
        return [[ : ]] .. vim.fn.wordcount()["chars"]
    end

    require("lualine").setup({
        options = {
            theme = "nightfox",
            icons_enabled = 1,
            padding = 1,
            left_padding = 1,
            right_padding = 1,
            upper = false,
            lower = false,
            format = nil,
            section_separators = { "", "" },
            component_separators = { "│", "│" },
            globalstatus = vim.opt.laststatus:get(),
        },
        sections = {
            lualine_a = { { "mode", lower = true } },
            lualine_b = { "branch" },
            -- lualine_c = {{require'lsp-status'.status()}},
            lualine_c = { { "require'lsp-status'.status()" }, { Word_count } },
            lualine_x = { "filetype", "encoding" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        extensions = { "quickfix", "nvim-tree" },
    })
end

function M.bufferline()
    require("bufferline").setup({
        options = {
            numbers = "none",
            close_command = "bdelete! %d",
            right_mouse_command = "bdelete! %d",
            left_mouse_command = "buffer %d",
            middle_mouse_command = nil,
            indicator_icon = "▎",
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            name_formatter = function(buf)
                if buf.name:match("%.md") then
                    return vim.fn.fnamemodify(buf.name, ":t:r")
                end
            end,
            --[[ max_name_length = 15,
      max_prefix_length = 10, ]]
            tab_size = 6,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or " "
                return "" .. icon .. count
            end,
            offsets = { { filetype = "NvimTree", text = " File Explorer", text_align = "center" } },
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = false,
            persist_buffer_sort = false,
            separator_style = "thin",
            enforce_regular_tabs = false,
            always_show_bufferline = true,
            sort_by = "id",
        },
        highlights = {
            fill = {
                guibg = "#333333",
            },
            buffer_selected = {
                guifg = "orange",
            },
            separator_selected = {
                guifg = "#333333",
            },
            separator_visible = {
                guifg = "#333333",
            },
            separator = {
                guifg = "#333333",
            },
        },
    })
end

return M
