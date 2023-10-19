local M = {}

function M.setup()
  vim.keymap.set('n', '<m-r>', function()
    require('genf.asyncrun').asyncrun('task execute')
  end)

  vim.keymap.set('n', '<m-s>', function()
    require('genf.asyncrun').asyncstop()
  end)

  vim.keymap.set('n', '<space>f', function()
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

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('tsserver')
end

return M
