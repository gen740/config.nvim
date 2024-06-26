---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.set_log_level('DEBUG')
    for _, lang in ipairs {
      'cpp',
      'cmake',
      'dockerfile',
      'go',
      'json',
      'julia',
      'lua',
      'nix',
      'python',
      'toml',
      'rust',
      'swift',
      'yaml',
      'typst',
      'typescript',
    } do
      require('genf.language_services.' .. lang).lsp_config()
    end
  end,
}
