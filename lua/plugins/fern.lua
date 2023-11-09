return {
  'lambdalisue/fern.vim',
  dependencies = {
    'lambdalisue/nerdfont.vim',
    'lambdalisue/fern-renderer-nerdfont.vim',
    'lambdalisue/fern-git-status.vim',
    'lambdalisue/fern-hijack.vim',
  },
  cmd = 'Fern',
  config = function()
    vim.fn['fern_git_status#init']()
    vim.g['fern#renderer'] = 'nerdfont'
    vim.g['fern#hide_cursor'] = 1
    vim.api.nvim_create_autocmd({ 'Filetype' }, {
      pattern = 'fern',
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.keymap.set('n', 'r', '<Plug>(fern-action-reload:all)<cr>', { buffer = true, noremap = true, silent = true })
      end,
    })
  end,
}
