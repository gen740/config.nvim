local M = {}

M.expr = function()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    local bufname = ''
    if
      vim.api.nvim_get_option_value('filetype', { buf = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)] }) == 'lazygit'
    then
      bufname = 'Lazygit'
    elseif
      vim.api.nvim_get_option_value('filetype', { buf = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)] })
      == 'ToggleTerm'
    then
      bufname = 'Terminal'
    elseif
      vim.api.nvim_get_option_value('filetype', { buf = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)] })
      == 'ToggleIpython3'
    then
      bufname = 'IPython'
    else
      bufname = vim.fn.bufname(vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)])
    end

    if bufname == '' then
      s = s .. ' ' .. '[No Name]' .. ' '
    else
      s = s .. ' ' .. vim.fn.pathshorten(bufname) .. ' '
    end
  end

  s = s .. '%#TabLineFill#%T'
  return s
end

return M
