---@diagnostic disable:missing-fields
---@type LazyPluginBase[]
return {
  {
    'lambdalisue/fern.vim',
    dependencies = {
      'lambdalisue/fern-git-status.vim',
    },
    cmd = 'Fern',
    config = function()
      vim.fn['fern_git_status#init']()
      vim.g['fern#hide_cursor'] = 1
      vim.api.nvim_create_autocmd({ 'Filetype' }, {
        pattern = 'fern',
        callback = function()
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
