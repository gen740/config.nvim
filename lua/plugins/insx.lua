return {
  'hrsh7th/nvim-insx',
  config = function()
    local standard = require('insx.preset.standard')

    local quate_list = { "'", '"', '``' }
    local pair_list = {
      ['('] = ')',
      ['['] = ']',
      ['{'] = '}',
    }

    for open, close in pairs(pair_list) do
      standard.set_pair('i', open, close)
    end

    for _, v in ipairs(quate_list) do
      standard.set_quote('i', v, {
        {
          enabled = function(enabled, ctx) ---@param ctx insx.Context
            return ctx.filetype ~= 'TelescopePrompt' and enabled(ctx)
          end,
        },
      })
    end
  end,
}
