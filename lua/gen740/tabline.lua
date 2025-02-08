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
    local bufname = vim.fn.bufname(bufnr)
    if vim.fn.bufname(bufnr) == '' then
      title.name = '[No Name]'
    else
      title.name = vim.fn.pathshorten(bufname)
    end
    s = s .. ' ' .. title.name .. ' '
  end

  s = s .. '%#TabLineFill#%T'
  return s
end

return M
