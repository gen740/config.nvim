local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('CumtomFiletypeSetting', { clear = true })

local function load_languageconfig(name)
  if
    pcall(require, 'genf.language_services.' .. name)
    and pcall(require('genf.language_services.' .. name).setup)
  then
    require('genf.language_services.' .. name).setup()
  end
end

local languages = { 'lua', 'tex', 'cpp', 'python', 'fern' }

autocmd('FileType', {
  group = 'CumtomFiletypeSetting',
  pattern = '*',
  callback = function(args)
    load_languageconfig(args.match)
  end,
})
