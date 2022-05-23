return {
    telescope = function()
        local actions = require("telescope.actions")
        require("telescope").setup {
            defaults = {
                mappings = {
                    i = {
                        ["<cr>"] = actions.select_default,
                        ["<esc>"] = actions.close,
                    },
                    n = {
                        ["<esc>"] = actions.close,
                        ["<cr>"] = actions.select_default,
                    },
                },
                vimgrep_arguments = {
                    "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--trim"
                },
                prompt_prefix = "  ",
                layout_config = {
                    prompt_position = "top",
                    width = 0.8,
                },
                selection_caret = " ▶ ",
                entry_prefix = "   ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                file_ignore_patterns = {
                    "node_modules/*",
                    "third_parties/*",
                    "__pycache__",
                    ".github",
                    ".cache",
                    ".DS_Store",
                    ".gitignore",
                },
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                use_less = true,
            },
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                },
            },
        }
        require("telescope").load_extension("fzf")
    end
}
