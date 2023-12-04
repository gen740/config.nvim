local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('CumtomFiletypeSetting', { clear = true })

local function load_languageconfig(name)
  require('genf.language_services.' .. name).setup()
end

autocmd('FileType', {
  group = 'CumtomFiletypeSetting',
  pattern = '*',
  callback = function(args)
    vim.treesitter.stop()
    pcall(load_languageconfig, args.match)
  end,
})
