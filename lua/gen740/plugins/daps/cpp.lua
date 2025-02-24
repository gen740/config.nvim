local dap = require('dap')

dap.adapters.lldb = {
  type = 'executable',
  command = 'lldb-dap',
  name = 'lldb',
}
dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      local program = vim.env.NVIM_DEBUG_PROGRAM
      if program ~= nil then
        return program
      end
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = [[${workspaceFolder}]],
  },
}
dap.configurations.c = dap.configurations.cpp
