local dap = require('dap')
dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch file',
    program = function()
      local program = vim.env.NVIM_DEBUG_PROGRAM
      if program ~= nil then
        return program
      end
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    pythonPath = 'python',
  },
}
