return {
  'lambdalisue/fern.vim',
  dependencies = {
    'lambdalisue/nerdfont.vim',
    'lambdalisue/fern-renderer-nerdfont.vim',
    'lambdalisue/fern-hijack.vim',
  },
  config = function()
    vim.g['fern#renderer'] = 'nerdfont'
    vim.g['fern#hide_cursor'] = 1
  end,
}
