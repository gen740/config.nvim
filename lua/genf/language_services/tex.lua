local M = {}

local lmap = require('genf.language_services.utils').set_local_map

function M.setup()
  local skim_started = false
  lmap('n', '<m-c>', function()
    vim.cmd(
      'Run lualatex --shell-escape --file-line-error -synctex=1 -interaction=batchmode '
        .. vim.fn.expand('%:p')
    )
  end)

  vim.api.nvim_create_augroup('LatexAutoCompile', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    group = 'LatexAutoCompile',
    pattern = '*.tex',
    callback = function()
      vim.cmd(
        'Run lualatex --shell-escape --file-line-error -synctex=1 -interaction=batchmode '
          .. vim.fn.expand('%:p')
      )
    end,
  })

  lmap('n', '<space>ll', function()
    if not skim_started then
      vim.fn.serverstart('/Users/gen/.cache/nvim/synctex-server.pipe')
      vim.cmd('silent !yabai -m window --grid 1:2:0:0:1:1')
    end
    vim.cmd(
      'silent !displayline -n -b -g'
        .. ' '
        .. vim.fn.line('.')
        .. ' '
        .. './document.pdf'
        .. ' '
        .. vim.fn.expand('%:p')
    )
    if not skim_started then
      vim.cmd(
        [[silent !yabai -m query --windows | jq -r 'map(select(.app == "Skim")) | .[0] | .id' | xargs -I{} yabai -m window {} --grid 1:2:1:0:1:1]]
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

  lmap('n', '<leader>s', function()
    vim.fn.jobstart(
      'zathura --synctex-forward '
        .. vim.fn.line('.')
        .. ':'
        .. vim.fn.col('.')
        .. ':'
        .. vim.fn.expand('%:p')
        .. ' '
        .. './document.pdf'
    )
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2

  local autocmd = vim.api.nvim_create_autocmd

  autocmd({ 'FileType tex' }, {
    callback = function()
      vim.g.lexima_enable_basic_rules = 0
      vim.g.lexima_enable_newline_rules = 0
      vim.g.lexima_enable_endwise_rules = 0
      vim.api.nvim_call_function('lexima#set_default_rules', {})
    end,
  })

  --
  local special_key = {
    a = [[\alpha]],
    b = [[\beta]],
    c = [[\chi]],
    d = [[\delta]],
    e = [[\epsilon]],
    ve = [[\varepsilon]],
    m = [[\mu]],
    n = [[\nu]],
    o = [[\omega]],
    ph = [[\phi]],
    ps = [[\psi]],
    hb = [[\hbar]],
  }

  special_key['%'] = [[\%]]

  for name, val in pairs(special_key) do
    lmap('i', '%' .. name, val)
  end
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('texlab')
end

return M
