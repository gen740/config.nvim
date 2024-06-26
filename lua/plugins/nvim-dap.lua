---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'rcarriga/nvim-dap-ui',
  dependencies = {
    'mfussenegger/nvim-dap',
    'nvim-neotest/nvim-nio',
  },
  keys = { '<m-b>', '<m-n>', '<m-i>', '<m-o>', '<m-s>', '<space>dl' },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')

    local function load_config(name)
      require('genf.language_services.' .. name).dap_config()
    end

    local languages = { 'python', 'cpp' }

    for _, lang in ipairs(languages) do
      load_config(lang)
    end

    dapui.setup()

    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open {}
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close {}
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close {}
    end
  end,
}
