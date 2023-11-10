local config = {
  config = function()
    for key, val in pairs {
      SmoothCursor = { bg = nil, fg = '#8aa872' },
      SmoothCursorBody = { bg = nil, fg = '#8aa872' },
    } do
      vim.api.nvim_set_hl(0, key, val)
    end

    require('smoothcursor').setup {
      disable_float_win = true,
      disabled_filetypes = { 'NeogitStatus', 'NeogitPopup', 'NeogitCommitMessage' },
      priority = 100,
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

    local autocmd = vim.api.nvim_create_autocmd

    autocmd({ 'ModeChanged' }, {
      group = 'CustomAutocommand',
      callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == 'n' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = '#8aa872' })
          vim.fn.sign_define('smoothcursor', { text = '●' })
        elseif current_mode == 'v' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = '#bf616a' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'V' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = '#bf616a' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == '' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#bf616a' })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = '#bf616a' })
          vim.fn.sign_define('smoothcursor', { text = '' })
        elseif current_mode == 'i' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#668aab' })
          vim.api.nvim_set_hl(0, 'SmoothCursorBoby', { fg = '#668aab' })
          vim.fn.sign_define('smoothcursor', { text = '●' })
        end
      end,
    })
  end,
}

if vim.fn.isdirectory('/Users/gen/.local/tools/SmoothCursor.nvim') == 1 then
  config['dir'] = '/Users/gen/.local/tools/SmoothCursor.nvim'
else
  config['url'] = 'https://github.com/gen740/SmoothCursor.nvim'
end

return config
