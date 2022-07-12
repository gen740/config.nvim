local get_opt = function(opt)
    return vim.api.nvim_get_option_value(opt, { scope = 'local' })
end

function MyFoldText()
    local fillchars = get_opt('fillchars')
    local numwidth = get_opt('numberwidth')
    local linetext = ''
    local foldtext = ''
    local align = 0
    if get_opt('foldmethod') == 'diff' then
        linetext = ''
        foldtext = '---------- '
            .. (vim.api.nvim_get_vvar('foldend') - vim.api.nvim_get_vvar('foldstart') + 1)
            .. ' lines the same ----------'
        align = vim.fn.winwidth(0) - get_opt('foldcolumn') -
            (get_opt('number') and math.max(vim.fn.strwidth(vim.fn.line('$')) + 1, numwidth) or 0)
        align = (align / 2) + (vim.fn.strwidth(foldtext) / 2)
        vim.api.nvim_set_option_value('fillchars', fillchars .. "fold:", { scope = 'local' })
    else
        foldtext = '┈ '
            .. (vim.api.nvim_get_vvar('foldend') - vim.api.nvim_get_vvar('foldstart') + 1)
            .. ' ﲐ' .. ' ┠'
        local endofline = 73
        linetext = vim.fn.strpart(vim.fn.getline(vim.api.nvim_get_vvar('foldstart')), 0,
            endofline - vim.fn.strwidth(foldtext))
        align = endofline - vim.fn.strwidth(linetext)
    end
    print(linetext .. string.rep(' ', math.floor(align)) .. foldtext)
    return linetext .. string.rep(' ', math.floor(align)) .. foldtext
end

if vim.fn.has("folding") then
    vim.opt.foldtext = [[luaeval('MyFoldText()')]]
    local fillchars = get_opt('fillchars')
    vim.api.nvim_set_option_value('fillchars', fillchars .. "fold:─", { scope = 'local' })
end
