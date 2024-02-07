---@diagnostic disable:missing-fields
---@type LazyPluginBase
local config = {
  name = 'SmoothCursor',
  config = function()
    local n_body_fg = '#b46950'
    local i_body_fg = '#668aab'
    local v_body_fg = '#8aa872'

    for key, val in pairs {
      SmoothCursor = { bg = nil, fg = n_body_fg },
      SmoothCursorBody = { bg = nil, fg = n_body_fg },
    } do
      vim.api.nvim_set_hl(0, key, val)
    end

    require('smoothcursor').setup {
      disable_float_win = true,
      disabled_filetypes = {
        'NeogitStatus',
        'NeogitPopup',
        'NeogitCommitMessage',
        'dapui_scopes',
        'dapui_breakpoints',
        'dapui_stacks',
        'dapui_watches',
        'dap-repl',
        'dapui_console',
      },
      priority = 1,
      autostart = true,
      threshold = 3,
      speed = 10,
      type = 'default',
      intervals = 30,
      fancy = {
        enable = true,
        head = {
          cursor = ' ',
          texthl = 'SmoothCursor',
        },
        body = {
          { cursor = '', texthl = 'SmoothCursorBody' },
          { cursor = '󰧞', texthl = 'SmoothCursorBody' },
          { cursor = '󰧟', texthl = 'SmoothCursorBody' },
        },
      },
      show_last_positions = nil,
    }

    local sc = require('smoothcursor.utils')
    vim.api.nvim_create_augroup('SmoothCursorReactive', { clear = true })
    vim.api.nvim_create_autocmd({ 'ModeChanged' }, {
      group = 'SmoothCursorReactive',
      callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == 'n' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = n_body_fg })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = n_body_fg })
          vim.fn.sign_define('smoothcursor', { text = ' ' })
        elseif current_mode == 'v' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = v_body_fg })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = v_body_fg })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'V' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = v_body_fg })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = v_body_fg })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == '' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = v_body_fg })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = v_body_fg })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'i' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = i_body_fg })
          vim.api.nvim_set_hl(0, 'SmoothCursorBoby', { fg = i_body_fg })
          vim.fn.sign_define('smoothcursor', { text = '' })
        end
        sc.smoothcursor_redraw()
      end,
    })
  end,
  priority = 60,
}

if vim.fn.isdirectory('/Users/gen/.local/tools/SmoothCursor.nvim') == 1 then
  config['dir'] = '/Users/gen/.local/tools/SmoothCursor.nvim'
else
  config['url'] = 'https://github.com/gen740/SmoothCursor.nvim'
end

return config
