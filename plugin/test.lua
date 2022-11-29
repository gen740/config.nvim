local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('CumtomFiletypeSetting', { clear = true })

local function load_languageconfig(name)
  if
    pcall(require, 'genf.language_services.' .. name)
    and pcall(require('genf.language_services.' .. name).ft_setup)
  then
    require('genf.language_services.' .. name).setup()
  end
end

autocmd({ 'FileType' }, {
  pattern = { '*' },
  group = 'CumtomFiletypeSetting',
  callback = function()
    load_languageconfig(vim.api.nvim_buf_get_option(0, 'filetype'))
  end,
})
