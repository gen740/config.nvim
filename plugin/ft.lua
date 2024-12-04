local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('CustomFiletypeSetting', { clear = true })
autocmd('FileType', {
  group = 'CustomFiletypeSetting',
  pattern = '*',
  callback = function(args)
    pcall(function(name)
      require('genf.ftautocmd.ft-' .. name).setup()
    end, args.match)
  end,
})
