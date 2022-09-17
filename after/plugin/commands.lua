vim.api.nvim_create_user_command("Run", function(args)
    require("genf.asyncrun").asyncrun(args.fargs[1])
end, { nargs = 1 })

vim.api.nvim_create_user_command("ReRun", function()
    require("genf.asyncrun").asyncrun(nil)
end, {})
