local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  local skim_started = false

  -- vim.api.nvim_create_augroup('LatexAutoCompile', { clear = true })
  -- vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  --   group = 'LatexAutoCompile',
  --   pattern = '*.tex',
  --   callback = function()
  --     require('genf.asyncrun').asyncbuild('task build', {
  --       efm = '%f:%l:%m',
  --     })
  --   end,
  -- })
  -- nvim --server ~/.cache/nvim/synctex-server.pipe --remote-send  "<cmd>%line<cr>"
  lmap('n', '<space>ll', function()
    if not skim_started then
      vim.fn.serverstart(vim.env.HOME .. '/.cache/nvim/synctex-server.pipe')
      vim.cmd('silent !yabai -m window --grid 1:7:0:0:4:1')
    end
    vim.cmd(
      'silent !displayline -n -g'
        .. ' '
        .. vim.fn.line('.')
        .. ' '
        .. './build/document.pdf'
        .. ' '
        .. vim.fn.expand('%:p')
    )
    if not skim_started then
      vim.cmd(
        [[silent !yabai -m query --windows | jq -r 'map(select(.app == "Skim")) | .[0] | .id' | xargs -I{} yabai -m window {} --grid 1:7:4:0:3:1]]
      )

      vim.api.nvim_create_augroup('LatexSyncTex', { clear = true })
      vim.api.nvim_create_autocmd({ 'UILeave' }, {
        group = 'LatexSyncTex',
        callback = function()
          vim.cmd('silent !yabai -m window --grid 1:1:0:0:1:1')
          vim.cmd('silent !pkill Skim')
          skim_started = false
        end,
      })
    end
    skim_started = true
  end)

  lmap('n', '<space>lc', function()
    vim.fn.jobstart([[yabai -m window --grid 1:1:0:0:1:1]])
    vim.fn.jobstart([[pkill Skim]])
    skim_started = false
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('texlab')
end

return M
