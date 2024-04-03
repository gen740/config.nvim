---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'neovim/nvim-lspconfig',
  config = function()
    for _, lang in ipairs {
      'cpp',
      'go',
      'json',
      'julia',
      'lua',
      'python',
      'rust',
      'swift',
      'yaml',
      'typescript',
    } do
      require('genf.language_services.' .. lang).lsp_config()
    end
  end,
}
