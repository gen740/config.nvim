local M = {}

function M.setup()
  vim.keymap.set('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task execute')
  end)

  vim.keymap.set('n', '<m-c>', function()
    require('genf.asyncrun').asyncrun('task compile')
  end)

  vim.keymap.set('n', '<m-g>', function()
    require('genf.asyncrun').asyncrun('task cmake')
  end)

  vim.keymap.set('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  vim.keymap.set('n', '<m-e>', function()
    require('genf.asyncrun').asyncrun([[task ]] .. vim.fn.expand('%:t:r'))
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('ghdl_ls')
end


return M
