local function setup()
  local dap, dapui = require('dap'), require('dapui')
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

  dapui.setup {
    icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
    mappings = {
      expand = { '<CR>', '<2-LeftMouse>' },
      open = 'o',
      remove = 'd',
      edit = 'e',
      repl = 'r',
      toggle = 't',
    },
    element_mappings = {
      -- Example:
      -- stacks = {
      --   open = "<CR>",
      --   expand = "o",
      -- }
    },
    expand_lines = vim.fn.has('nvim-0.7') == 1,
    layouts = {
      {
        elements = {
          { id = 'scopes', size = 0.25 },
          'breakpoints',
          'stacks',
          'watches',
        },
        size = 40,
        position = 'left',
      },
      {
        elements = {
          'repl',
          'console',
        },
        size = 0.25,
        position = 'bottom',
      },
    },
    controls = {
      enabled = true,
      element = 'repl',
      icons = {
        pause = '',
        play = '',
        step_into = '',
        step_over = '',
        step_out = '',
        step_back = '',
        run_last = '↻',
        terminate = '□',
      },
    },
    floating = {
      max_height = nil,
      max_width = nil,
      border = 'single',
      mappings = {
        close = { 'q', '<Esc>' },
      },
    },
    windows = { indent = 1 },
    render = {
      max_type_length = nil,
      max_value_lines = 100,
    },
  }
  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated['dapui_config'] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited['dapui_config'] = function()
    dapui.close()
  end
end

return {
  setup = setup,
}
