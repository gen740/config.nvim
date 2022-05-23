M = {}

function M.treesitter()
    require("nvim-treesitter.configs").setup {
        ensure_installed = { "c", "python", "cpp", "lua", "rust", "vim" },
        highlight = { enable = true },
        indent = { enable = false },
        yati = { enable = true },
        refactor = {
            highlight_definitions = { enable = true },
            highlight_current_scope = { enable = false },
        },
        matchup = {
            enable = true,
        },
        autotag = {
            enable = true,
        }
    }
end

function M.treesitter_context()
    require 'treesitter-context'.setup {
        enable = true,
        throttle = true,
        max_lines = 0,
        patterns = {
            default = {
                'class',
                'function',
                'method',
            },
        }
    }
end

return M
