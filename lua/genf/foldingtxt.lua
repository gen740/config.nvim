local M = {}
local function get_lopt(opt)
  return vim.api.nvim_get_option_value(opt, { scope = 'local' })
end

local function get_vvar(opt)
  return vim.api.nvim_get_vvar(opt)
end

M.expr = function()
  local foldtext = {}
  local align = 0
  local treesitter_text = vim.treesitter.foldtext()

  if get_lopt('foldmethod') == 'diff' then
    foldtext = '┈┈┈┈┈┈┈┈┈┈  ' .. (get_vvar('foldend') - get_vvar('foldstart') + 1) .. ' lines '
    return foldtext
  else
    foldtext = '┈ ' .. (get_vvar('foldend') - get_vvar('foldstart') + 1) .. ' ﲐ ┈'
    local endofline = get_lopt('colorcolumn') - 3

    local word_length = 0
    -- count treesitter text word length
    if type(treesitter_text) == 'string' then
      word_length = vim.fn.strwidth(treesitter_text)
    else
      for _, word in ipairs(treesitter_text) do
        word_length = word_length + vim.fn.strwidth(word[1])
      end
    end
    align = endofline - word_length
  end

  treesitter_text[#treesitter_text + 1] = { string.rep('┈', math.floor(align)) .. foldtext, {} }

  return treesitter_text
end

return M
