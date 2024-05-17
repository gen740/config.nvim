vim.api.nvim_create_augroup('CustomAutocommand', { clear = true })
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  group = 'CustomAutocommand',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'Search',
    }
  end,
})

vim.api.nvim_create_augroup('LazyGitTabClose', { clear = true })
vim.api.nvim_create_autocmd({ 'TermClose' }, {
  group = 'LazyGitTabClose',
  callback = function(arg)
    pcall(function()
      if vim.api.nvim_get_option_value('filetype', { buf = arg.buf }) == 'lazygit' then
        require('genf.lazygit').lazygit_server_stop()
        vim.cmd('bd!')
      end
    end)
  end,
})

vim.api.nvim_create_augroup('WinBarLspProgress', { clear = true })
vim.api.nvim_create_autocmd({ 'LspProgress' }, {
  callback = function(event)
    local kind = event.data.params.value.kind
    if kind == 'begin' then
      ---@type lsp.WorkDoneProgressBegin
      local mes = event.data.params.value
      require('genf.winbar').set_current_progress {
        in_progress = true,
        value = {
          message = mes.message,
          percentage = mes.percentage,
          title = mes.title,
        },
      }
    elseif kind == 'report' then
      ---@type lsp.WorkDoneProgressReport
      local mes = event.data.params.value
      require('genf.winbar').set_current_progress {
        in_progress = true,
        value = {
          message = mes.message,
          percentage = mes.percentage,
        },
      }
    elseif kind == 'end' then
      ---@type lsp.WorkDoneProgressEnd
      require('genf.winbar').set_current_progress {
        in_progress = false,
      }
    end
    vim.cmd('redrawstatus')
  end,
  group = 'WinBarLspProgress',
})

vim.api.nvim_create_augroup('QfSyntax', { clear = true })
vim.api.nvim_create_autocmd({ 'QuickFixCmdPost', 'BufRead' }, {
  callback = function(ft)
    if ft.file == 'quickfix' or ft.event == 'QuickFixCmdPost' then
      local qfwinid = vim.fn.getqflist({ winid = 0 }).winid
      vim.fn.win_execute(qfwinid, 'syntax clear')
      vim.fn.win_execute(qfwinid, 'syntax match ErrorMsg //')
      vim.fn.win_execute(qfwinid, 'syntax match WarningMsg //')
      vim.fn.win_execute(qfwinid, 'syntax match MoreMsg //')

      vim.fn.win_execute(qfwinid, [[syntax match QfFileName /▏\zs.*\ze|[0-9:]*|/]])
      vim.fn.win_execute(qfwinid, [[syntax match QfLineNr /|\zs[0-9:]*\ze|/]])
    end
  end,
  group = 'QfSyntax',
})
