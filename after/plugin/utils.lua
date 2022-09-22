function TrimUseless()
  local current_view = vim.fn.winsaveview()
  vim.cmd([[
        keeppatterns %s/\n\+$/\r/ge
        keeppatterns %s/\s\+$//e
    ]])
  vim.fn.winrestview(current_view)
end
