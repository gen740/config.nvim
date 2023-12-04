---@diagnostic disable:missing-fields
---@type LazyPluginBase
local config = {
  name = 'SmoothCursor',
  config = function()
    local palette = require('nightfox.palette.nordfox').palette
    local n_body_fg = palette.orange.dim
    local i_body_fg = palette.blue.dim
    local v_body_fg = palette.green.dim

    for key, val in pairs {
      SmoothCursor = { bg = nil, fg = n_body_fg },
      SmoothCursorBody = { bg = nil, fg = n_body_fg },
    } do
      vim.api.nvim_set_hl(0, key, val)
    end

    require('smoothcursor').setup {
      disable_float_win = true,
      disabled_filetypes = { 'NeogitStatus', 'NeogitPopup', 'NeogitCommitMessage' },
      priority = 1,
      autostart = true,
      threshold = 3,
      speed = 40,
      type = 'default',
      intervals = 50,
      fancy = {
        enable = true,
        head = {
          cursor = '●',
          texthl = 'SmoothCursor',
        },
        body = {
          { cursor = '•', texthl = 'SmoothCursorBody' },
          { cursor = '∙', texthl = 'SmoothCursorBody' },
        },
      },
    }

    vim.api.nvim_create_augroup('SmoothCursorReactive', { clear = true })
    vim.api.nvim_create_autocmd({ 'ModeChanged' }, {
      group = 'SmoothCursorReactive',
      callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == 'n' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = n_body_fg })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = n_body_fg })
          vim.fn.sign_define('smoothcursor', { text = '●' })
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
          vim.fn.sign_define('smoothcursor', { text = '●' })
        end
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
