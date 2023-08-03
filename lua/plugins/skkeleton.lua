return {
  'vim-skk/skkeleton',
  dependencies = {
    'vim-denops/denops.vim',
  },
  config = function()
    vim.api.nvim_create_augroup('skkeleton-initialize-pre', { clear = true })

    vim.api.nvim_create_autocmd({ 'User' }, {
      group = 'skkeleton-initialize-pre',
      pattern = '*',
      callback = function()
        vim.call('skkeleton#config', {
          globalDictionaries = {
            '~/.local/tools/dict/SKK-JISYO.L',
            '~/.local/tools/dict/SKK-JISYO.geo',
            '~/.local/tools/dict/SKK-JISYO.jinmei',
            '~/.local/tools/dict/SKK-JISYO.propernoun',
          },
        })
        vim.call('skkeleton#register_keymap', 'input', ';', 'henkanPoint')
      end,
    })
  end,
}
