local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
  vim.opt_local.commentstring = '// %s'

  lmap('n', '<space>to', function()
    vim.cmd('silent !yabai -m window --grid 1:7:0:0:4:1')
    vim.cmd(
      'silent !'
        .. 'osascript '
        .. vim.fn.stdpath('config')
        .. '/scripts/OpenPDFBackground.js '
        .. vim.fn.expand('%:p:r')
        .. '.pdf'
    )
    vim.cmd(
      [[silent !yabai -m query --windows | jq -r 'map(select(.app == "Skim")) | .[0] | .id' | xargs -I{} yabai -m window {} --grid 1:7:4:0:3:1]]
    )
  end)

  lmap('n', '<space>tn', function()
    vim.system { 'osascript', vim.fn.stdpath('config') .. '/scripts/SkimNextPage.js' }
  end)

  lmap('n', '<space>tp', function()
    vim.system { 'osascript', vim.fn.stdpath('config') .. '/scripts/SkimPreviousPage.js' }
  end)
end

function M.lsp_config()
  local lsp_utils = require('genf.language_services.utils')
  lsp_utils.lsp_setup('typst_lsp')
end

return M
