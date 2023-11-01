local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  lmap('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task execute')
  end)

  lmap('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  lmap('n', '<space>f', function()
    vim.cmd('w')
    require('genf.asyncrun').asyncrun(
      'prettier --write ' .. vim.fn.expand('%:p'),
      function()
        local current_line = vim.fn.line('.')
        local win_view = vim.fn.winsaveview()
        vim.cmd('e!')
        vim.fn.winrestview(win_view)
        vim.fn.cursor(current_line, 0)
      end,
      true
    )
  end)

  local shiftwidth = 2

  vim.opt_local.tabstop = shiftwidth
  vim.opt_local.softtabstop = shiftwidth
  vim.opt_local.shiftwidth = shiftwidth
end

local lsp_utils = require('genf.language_services.utils')

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('tsserver')
end

return M
