local M = {}

M.expr = function()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end

    local bufname = vim.fn.bufname(vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)])
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
