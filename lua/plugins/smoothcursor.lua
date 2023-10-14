return {
  dir = '/Users/gen/.local/tools/SmoothCursor.nvim',
  config = function()
    for key, val in pairs {
      SmoothCursor = { bg = nil, fg = '#8aa872' },
      SmoothCursorBody = { bg = nil, fg = '#8aa872' },
    } do
      vim.api.nvim_set_hl(0, key, val)
    end

    require('smoothcursor').setup {
      disable_float_win = true,
      disabled_filetypes = { 'NeogitStatus', 'NeogitPopup' },
      priority = 100,
      autostart = true,
      threshold = 0,
      speed = 30,
      type = 'default',
      intervals = 50,
      fancy = {
        enable = true,
        head = { cursor = '', texthl = 'SmoothCursor' },
        body = {
          { cursor = '●', texthl = 'SmoothCursorBody' },
          { cursor = '●', texthl = 'SmoothCursorBody' },
          { cursor = '•', texthl = 'SmoothCursorBody' },
          { cursor = '•', texthl = 'SmoothCursorBody' },
          { cursor = '∙', texthl = 'SmoothCursorBody' },
          { cursor = '∙', texthl = 'SmoothCursorBody' },
        },
      },
      -- flyin_effect = 'bottom',
    }

    local autocmd = vim.api.nvim_create_autocmd

    autocmd({ 'ModeChanged' }, {
      group = 'CustomAutocommand',
      callback = function()
        local current_mode = vim.fn.mode()
        if current_mode == 'n' then
          vim.api.nvim_set_hl(0, 'SmoothCursor', { fg = '#8aa872' })
          vim.api.nvim_set_hl(0, 'SmoothCursorBody', { fg = '#8aa872' })
          vim.fn.sign_define('smoothcursor', { text = '' })
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
          vim.fn.sign_define('smoothcursor', { text = '' })
        end
      end,
    })
  end,
}
