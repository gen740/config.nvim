return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    config = function()
      local map = function(mode, key, cmd)
        vim.keymap.set(mode, key, cmd, { noremap = true, silent = true })
      end

      local function notify(message)
        local has_notify = pcall(require, 'notify')
        if has_notify then
          require('notify')(message)
        else
          vim.notify(message)
        end
      end

      map('n', '<leader>ce', function()
        notify('Copilot enabled')
        require('copilot').setup {
          enabled = false,
          suggestion = {
            enabled = true,
            auto_trigger = true,
          },
          panel = { enabled = true },
        }
        map('n', '<leader>cd', function()
          -- disable copilot
          notify('Copilot disabled')
          vim.cmd([[Copilot disable]])
        end)
        map('n', '<leader>ce', function()
          -- enable copilot
          notify('Copilot enabled')
          vim.cmd([[Copilot enable]])
        end)
        map('i', '<m-n>', require('copilot.suggestion').next)
        map('i', '<m-p>', require('copilot.suggestion').prev)
        map('i', '<m-f>', require('copilot.suggestion').accept)
      end)
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
