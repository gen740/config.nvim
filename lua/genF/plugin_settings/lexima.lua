return {
    lexima = function()
        vim.defer_fn(function()
            vim.cmd([[
        try
            let g:lexima_enable_basic_rules = 1
            let g:lexima_enable_newline_rules = 1
            let g:lexima_enable_endwise_rules = 1
            call lexima#set_default_rules()
        catch
            echo "Please install Lexima Plugin"
        endtry
    ]]       )
        end, 100)
    end
}
