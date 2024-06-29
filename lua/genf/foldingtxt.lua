local M = {}
local function get_lopt(opt)
  return vim.api.nvim_get_option_value(opt, { scope = 'local' })
end
local function get_vvar(opt)
  return vim.api.nvim_get_vvar(opt)
end

M.expr = function()
  local foldtext = {}
  local treesitter_text = vim.treesitter.foldtext()

  if get_lopt('foldmethod') == 'diff' then
    foldtext = '┈┈┈┈┈┈┈┈┈┈  '
      .. (get_vvar('foldend') - get_vvar('foldstart') + 1)
      .. ' lines '
    return foldtext
  else
    foldtext = '   ' .. (get_vvar('foldend') - get_vvar('foldstart') + 1) .. ' '
    local word_length = 0
    if type(treesitter_text) == 'string' then -- count treesitter text word length
      word_length = vim.fn.strwidth(treesitter_text)
    else
      for _, word in ipairs(treesitter_text) do
        word_length = word_length + vim.fn.strwidth(word[1])
      end
    end
  end

  treesitter_text[#treesitter_text + 1] = { foldtext, {} }

  return treesitter_text
end

return M
