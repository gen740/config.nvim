---@diagnostic disable:missing-fields
---@type LazyPluginBase
return {
  'hrsh7th/nvim-insx',
  config = function()
    local insx = require('insx')
    local esc = require('insx').helper.regex.esc

    local wrap = function(left, right)
      return {
        action = function(ctx)
          local left_num = ''
          for _ = 1, string.len(right) do
            left_num = left_num .. '<LEFT>'
          end
          ctx.send(right .. left_num)
        end,
        enabled = function(ctx)
          return ctx.match(esc(left) .. [[\%#]])
        end,
      }
    end

    for _, value in ipairs {
      { '(', ')' },
      { '[', ']' },
      { '{', '}' },
    } do
      insx.add('%', wrap(value[1], value[2]), { mode = 'i' })
      insx.add(
        '<CR>',
        require('insx.recipe.fast_break') {
          open_pat = esc(value[1]),
          close_pat = esc(value[2]),
          arguments = true,
          html_attrs = true,
          html_tags = true,
        }
      )
    end

    for _, value in ipairs {
      { '```', '```' },
      { '"""', '"""' },
      { '"', '"' },
      { "'", "'" },
      { '$$', '$$' },
      { '$', '$' },
    } do
      insx.add('%', wrap(value[1], value[2]), { mode = 'i' })
    end
  end,
}
