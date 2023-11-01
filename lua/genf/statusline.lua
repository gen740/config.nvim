vim.opt.statusline = [[%{''}]]

function MyTabLine() end

vim.opt.tabline = [[v:lua.MyTabLine()]]
