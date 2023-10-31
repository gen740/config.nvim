return {
  'lambdalisue/fern.vim',
  dependencies = {
    'lambdalisue/nerdfont.vim',
    'lambdalisue/fern-renderer-nerdfont.vim',
    'lambdalisue/fern-git-status.vim',
    'lambdalisue/fern-hijack.vim',
  },
  cmd = 'Fern',
  init = function()
    vim.g['loaded_fern_git_status'] = 1
  end,
  config = function()
    vim.fn['fern_git_status#init']()
    vim.g['fern#renderer'] = 'nerdfont'
    vim.g['fern#hide_cursor'] = 1
  end,
}
