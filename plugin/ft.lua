local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup('CustomFiletypeSetting', { clear = true })
autocmd('FileType', {
  group = 'CustomFiletypeSetting',
  pattern = '*',
  callback = function(args)
    require('genf.language_services.utils').init()
    pcall(function(name)
      require('genf.language_services.' .. name).setup()
    end, args.match)
  end,
})
