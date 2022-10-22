M = {}

function M.nvim_dap()
  local dap = require('dap')
  dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/opt/llvm/bin/lldb-vscode', -- adjust as needed
    name = 'lldb',
  }
  dap.adapters.python = {
    type = 'executable',
    command = '/Users/fujimotogen/.pyenv/shims/python3',
    args = { '-m', 'debugpy.adapter' },
  }
  dap.configurations.cpp = {
    {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = [[${workspaceFolder}]],
      stopOnEntry = false,
      runInTerminal = false,
    },
  }
  dap.configurations.c = dap.configurations.cpp
  dap.configurations.rust = dap.configurations.cpp
  dap.configurations.python = {
    {
      type = 'python',
      request = 'launch',
      name = 'Launch file',
      program = '${file}', -- This configuration will launch the current file if used.
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/Users/fujimotogen/.pyenv/shims/python3'
        end
      end,
    },
  }
end

function M.dap_ui()
  require('dapui').setup {
    icons = { expanded = '▾', collapsed = '▸' },
    mappings = {
      expand = { '<CR>', '<2-LeftMouse>' },
      open = 'o',
      remove = 'd',
      edit = 'e',
      repl = 'r',
      toggle = 't',
    },
    expand_lines = vim.fn.has('nvim-0.7'),
    layouts = {
      {
        elements = {
          { id = 'scopes', size = 0.25 },
          'breakpoints',
          'stacks',
          'watches',
        },
        size = 40, -- 40 columns
        position = 'left',
      },
      {
        elements = {
          'repl',
          'console',
        },
        size = 0.25, -- 25% of total lines
        position = 'bottom',
      },
    },
    floating = {
      max_height = nil, -- These can be integers or a float between 0 and 1.
      max_width = nil, -- Floats will be treated as percentage of your screen.
      border = 'single', -- Border style. Can be "single", "double" or "rounded"
      mappings = {
        close = { 'q', '<Esc>' },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil, -- Can be integer or nil.
    },
  }
  local dap, dapui = require('dap'), require('dapui')
  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open {}
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close {}
  end
  dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close {}
  end
end

return M
