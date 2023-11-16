local M = {}

M.expr = function()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    local title = { icon = nil, name = nil }
    local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
    local ft = vim.api.nvim_get_option_value('filetype', { buf = bufnr })
    if ft == 'lazygit' then
      title = { icon = '', name = 'Lazygit' }
    elseif ft == 'ToggleTerm' then
      title = { icon = '', name = 'Terminal' }
    elseif ft == 'ToggleIpython3' then
      title = { icon = '', name = 'IPython' }
    else
      local bufname = vim.fn.bufname(bufnr)
      title.icon = vim.fn['nerdfont#find'](bufname)
      if vim.fn.bufname(bufnr) == '' then
        title.name = '[No Name]'
      else
        title.name = vim.fn.pathshorten(bufname)
      end
    end

    s = s .. ' ' .. title.icon .. ' ' .. title.name .. ' '
  end

  s = s .. '%#TabLineFill#%T'
  return s
end

return M
