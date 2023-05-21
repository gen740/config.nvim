local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('CumtomFiletypeSetting', { clear = true })
local languages = {
  'cmake', --
  'cpp',
  'objc',
  'objcpp',
  'fern',
  'go',
  'json',
  'lua',
  'python',
  'javascript',
  'tex',
  'toml',
  'yaml',
}

local function load_languageconfig(name)
  local flag = false
  for _, val in pairs(languages) do
    if name == val then
      flag = true
    end
  end
  if not flag then
    return
  end
  if
    pcall(require, 'genf.language_services.' .. name)
    and pcall(require('genf.language_services.' .. name).setup)
  then
    require('genf.language_services.' .. name).setup()
  end
end

autocmd('FileType', {
  group = 'CumtomFiletypeSetting',
  pattern = '*',
  callback = function(args)
    load_languageconfig(args.match)
  end,
})
--
-- augroup('DetectObjcpp', { clear = true })
--
-- autocmd({ 'BufRead', 'BufNewFile' }, {
--   pattern = { '*.mm' },
--   group = 'CustomAutocommand',
--   callback = function()
--     vim.opt_local.filetype = 'objcpp'
--   end,
-- })
