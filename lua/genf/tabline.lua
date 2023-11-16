local M = {}

M.expr = function()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    local bufname = { icon = nil, name = nil }
    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local ft = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
    if ft == 'lazygit' then
      bufname = { icon = '', name = 'Lazygit' }
    elseif ft == 'ToggleTerm' then
      bufname = { icon = '', name = 'Terminal' }
    elseif ft == 'ToggleIpython3' then
      bufname = { icon = '', name = 'IPython' }
    else
      bufname.icon = require('nvim-web-devicons').get_icon_by_filetype(ft)
      if vim.fn.bufname(bufnr) == '' then
        bufname.name = '[No Name]'
      else
        bufname.name = vim.fn.pathshorten(vim.fn.bufname(bufnr))
      end
    end

    s = s .. ' ' .. bufname.icon .. ' ' .. bufname.name .. ' '
  end

  s = s .. '%#TabLineFill#%T'
  return s
end

return M
