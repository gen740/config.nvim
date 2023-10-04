return {
  'cohama/lexima.vim',
  event = 'InsertEnter',
  config = function()
    vim.g.lexima_enable_basic_rules = 1
    vim.g.lexima_enable_newline_rules = 1
    vim.g.lexima_enable_endwise_rules = 1
    vim.api.nvim_call_function('lexima#set_default_rules', {})
  end,
}
