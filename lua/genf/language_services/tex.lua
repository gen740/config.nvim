local M = {}

local lmap = require('genf.language_services.utils').set_local_map
local async_format = require('genf.language_services.utils').async_format

function M.setup()
  local skim_started = false
  lmap('n', '<m-c>', function()
    vim.cmd('Run lualatex --shell-escape --file-line-error -synctex=1 -interaction=batchmode ' .. vim.fn.expand('%:p'))
  end)

  vim.api.nvim_create_augroup('LatexAutoCompile', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    group = 'LatexAutoCompile',
    pattern = '*.tex',
    callback = function()
      require('genf.asyncrun').asyncrun(
        'lualatex --shell-escape --file-line-error -synctex=1 -interaction=batchmode ' .. vim.fn.expand('%:p'),
        function()
          vim.defer_fn(function()
            if skim_started then
              vim.cmd(
                'silent !displayline -n -g'
                  .. ' '
                  .. vim.fn.line('.')
                  .. ' '
                  .. './document.pdf'
                  .. ' '
                  .. vim.fn.expand('%:p')
              )
            end
          end, 200)
        end
      )
    end,
  })

  lmap('n', '<space>ll', function()
    if not skim_started then
      vim.fn.serverstart('/Users/gen/.cache/nvim/synctex-server.pipe')
      vim.cmd('silent !yabai -m window --grid 1:7:0:0:4:1')
    end
    vim.cmd(
      'silent !displayline -n -g' .. ' ' .. vim.fn.line('.') .. ' ' .. './document.pdf' .. ' ' .. vim.fn.expand('%:p')
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

  lmap('n', '<space>f', function()
    vim.fn.timer_start(0, function()
      local current_line = vim.fn.line('.')
      local win_view = vim.fn.winsaveview()
      vim.cmd([[%!latexindent -y="defaultIndent:'  '" ]])
      ---@diagnostic disable-next-line
      vim.fn.winrestview(win_view)
      vim.fn.cursor(current_line, 0)
      vim.cmd('w!')
    end)
  end)

  vim.opt_local.tabstop = 2
  vim.opt_local.softtabstop = 2
  vim.opt_local.shiftwidth = 2
  vim.opt_local.colorcolumn = '101'

  if pcall(require, 'insx') then
    local insx = require('insx')
    local esc = require('insx').helper.regex.esc
    insx.add(
      '}',
      insx.with(
        require('insx.recipe.substitute') {
          pattern = [[\\begin{\([^}]*\)\%#}]],
          replace = [[\0\%#\end{\1}]],
        },
        {
          insx.with.priority(10),
        }
      )
    )

    require('insx.preset.standard').set_pair('i', '$', '$')
    -- insx.add(
    --   '$',
    --   insx.with(
    --     require('insx.recipe.auto_pair') {
    --       open = '$',
    --       close = '$',
    --     },
    --     {
    --       insx.with.priority(10),
    --       insx.with.in_string(false),
    --       insx.with.in_comment(false),
    --     }
    --   )
    -- )
    -- insx.add(
    --   '$',
    --   insx.with(
    --     require('insx.recipe.jump_next') {
    --       jump_pat = {
    --         [[\%#]] .. esc('$') .. [[\zs]],
    --       },
    --     },
    --     {
    --       insx.with.priority(11),
    --     }
    --   )
    -- )
  end
end

function M.lsp_config()
  require('genf.language_services.utils').lsp_setup('texlab')
end

return M
