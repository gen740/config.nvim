local function get_lopt(opt)
  return vim.api.nvim_get_option_value(opt, { scope = 'local' })
end

local function get_gopt(opt)
  return vim.api.nvim_get_option_value(opt, { scope = 'global' })
end

local function get_vvar(opt)
  return vim.api.nvim_get_vvar(opt)
end

function GenfFoldText()
  local fillchars = get_lopt('fillchars')
  local numwidth = get_lopt('numberwidth')
  local linetext = ''
  local foldtext = {}
  local align = 0
  local treesitter_text = vim.treesitter.foldtext()

  if get_lopt('foldmethod') == 'diff' then
    foldtext = '---------- '
      .. (get_vvar('foldend') - get_vvar('foldstart') + 1)
      .. ' lines the same ----------'
    align = vim.fn.winwidth(0)
      - get_lopt('foldcolumn')
      - (
        get_lopt('number')
          and math.max(
            vim.fn.strwidth(tostring(vim.fn.line('$'))) + 1,
            numwidth
          )
        or 0
      )
    align = (align / 2) + (vim.fn.strwidth(foldtext) / 2)
    vim.api.nvim_set_option_value(
      'fillchars',
      fillchars .. 'fold:',
      { scope = 'local' }
    )
  else
    foldtext = '┈ '
      .. (get_vvar('foldend') - get_vvar('foldstart') + 1)
      .. ' ﲐ ┈'
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

  treesitter_text[#treesitter_text + 1] =
    { string.rep('┈', math.floor(align)) .. foldtext, {} }

  return treesitter_text
end

if vim.fn.has('folding') then
  vim.opt.foldtext = [[luaeval('GenfFoldText()')]]
  local fillchars = get_gopt('fillchars')
  if fillchars ~= '' then
    fillchars = fillchars .. ','
  end
  if get_lopt('foldmethod') == 'diff' then
    vim.api.nvim_set_option_value(
      'fillchars',
      fillchars .. 'fold: ',
      { scope = 'local' }
    )
  else
    vim.api.nvim_set_option_value(
      'fillchars',
      fillchars .. 'fold:┈',
      { scope = 'local' }
    )
  end
end
