vim.keymap.set('n', '<m-r>', function()
  require('genf.asyncrun').asyncrun('task execute')
end)

-- vim.keymap.set('n', '<m-c>', function()
--   require('genf.asyncrun').asyncrun('task compile')
-- end)

vim.keymap.set('n', '<m-s>', function()
  require('genf.asyncrun').asyncstop()
end)

vim.keymap.set('n', '<leader>f', function()
  local has_indent_blankline = pcall(require, 'indent_blankline')
  if vim.fn.executable('black') then
    vim.cmd([[
        silent w
        ]])
    local current_view = vim.fn.winsaveview()
    vim.cmd([[
        silent !black -q %
        silent e
        ]])
    vim.fn.winrestview(current_view)
    if has_indent_blankline then
      require('indent_blankline.commands').refresh(true, true)
    end
  end
end)

local shiftwidth = 4

vim.opt_local.tabstop = shiftwidth
vim.opt_local.softtabstop = shiftwidth
vim.opt_local.shiftwidth = shiftwidth

vim.cmd('compiler python')

local lsp_utils = require('genf.lsp_utils')

if pcall(require, 'lspconfig') then
  local config = require('lspconfig')['pyright']
  config.setup {
    capabilities = lsp_utils.capabilities,
    on_attach = lsp_utils.on_attach,

    settings = {
      pyright = {
        disableLanguageServices = true,
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          diagnosticSeverityOverrides = {
            reportGeneralTypeIssues = 'error',
          },
        },
      },
    },
  }
  config.launch()
end
