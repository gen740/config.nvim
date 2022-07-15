local function get_lopt(opt)
    return vim.api.nvim_get_option_value(opt, { scope = 'local' })
end

local function get_gopt(opt)
    return vim.api.nvim_get_option_value(opt, { scope = 'global' })
end

local function get_vvar(opt)
    return vim.api.nvim_get_vvar(opt)
end

function MyFoldText()
    local fillchars = get_lopt('fillchars')
    local numwidth = get_lopt('numberwidth')
    local linetext = ''
    local foldtext = ''
    local align = 0
    if get_lopt('foldmethod') == 'diff' then
        linetext = ''
        foldtext = '---------- ' .. (get_vvar('foldend') - get_vvar('foldstart') + 1) .. ' lines the same ----------'
        align = vim.fn.winwidth(0) - get_lopt('foldcolumn') -
            (get_lopt('number') and math.max(vim.fn.strwidth(vim.fn.line('$')) + 1, numwidth) or 0)
        align = (align / 2) + (vim.fn.strwidth(foldtext) / 2)
        vim.api.nvim_set_option_value('fillchars', fillchars .. "fold:", { scope = 'local' })
    else
        foldtext = '┈ ' .. (get_vvar('foldend') - get_vvar('foldstart') + 1) .. ' ﲐ ┈'
        local endofline = 78
        linetext = vim.fn.strpart(vim.fn.getline(get_vvar('foldstart')), 0, endofline + 4)
        print(linetext)
        align = endofline - vim.fn.strwidth(linetext)
    end
    return linetext .. '  ' .. string.rep('┈', math.floor(align)) .. foldtext
end

if vim.fn.has("folding") then
    vim.opt.foldtext = [[luaeval('MyFoldText()')]]
    local fillchars = get_gopt('fillchars')
    if fillchars ~= "" then
        fillchars = fillchars .. ","
    end
    if get_lopt('foldmethod') == 'diff' then
        vim.api.nvim_set_option_value('fillchars', fillchars .. "fold: ", { scope = 'local' })
    else
        vim.api.nvim_set_option_value('fillchars', fillchars .. "fold:┈", { scope = 'local' })
    end
end
