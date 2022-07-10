require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'c',
        'python',
        'cpp',
        'lua',
        'rust',
        'vim',
        'julia',
        'typescript',
        'javascript',
        'go',
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = false },
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

-- function M.treesitter_context()
--     require 'treesitter-context'.setup {
--         enable = true,
--         throttle = true,
--         max_lines = 0,
--         patterns = {
--             default = {
--                 'class',
--                 'function',
--                 'method',
--             },
--         }
--     }
-- end
