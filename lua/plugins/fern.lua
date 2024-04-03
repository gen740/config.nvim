---@diagnostic disable:missing-fields
---@type LazyPluginBase[]
return {
  {
    'lambdalisue/fern.vim',
    cmd = 'Fern',
    config = function()
      vim.g['fern#hide_cursor'] = 1
      vim.api.nvim_create_autocmd({ 'Filetype' }, {
        pattern = 'fern',
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = 'no'
          vim.keymap.set(
            'n',
            'r',
            '<Plug>(fern-action-reload:all)<cr>',
            { buffer = true, noremap = true, silent = true }
          )
        end,
      })
    end,
  },
}
