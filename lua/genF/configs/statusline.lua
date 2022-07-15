local function setup()
    local lsp_status = require("lsp-status")
    -- lsp_status.register_progress()
    lsp_status.config({
        status_symbol = " ",
        current_function = true,
    })
end

local function lualine()
    require('lualine').setup({})
end

return {
    setup = setup,
    lualine = lualine
}
