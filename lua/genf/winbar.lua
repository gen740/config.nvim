if vim.fn.has('nvim-0.8') then
  function Get_git_branch()
    -- local branch = gitbranch.get_branch(vim.api.nvim_get_current_buf())
    local branch = require('genf.gitbranch').get_branch()
    if branch == '' then
      return ''
    end
    return ' ' .. branch
  end
  local lsp_status_section = [[]]

  if pcall(require, 'lsp-status') then
    lsp_status_section =
      [[%{luaeval('require("lsp-status").status()')} %{luaeval('require("lsp-status").messages().spinner or ""')} ]]
  end
  vim.opt.winbar = [[ %{luaeval('require("nvim-web-devicons").get_icon_by_filetype(vim.api.nvim_buf_get_option(0, "ft"))')} %#WinBarFileName#%f%* %M %=]]
    .. lsp_status_section
    .. [[%{luaeval('Get_git_branch()')}]]
  vim.opt.laststatus = 0
  vim.opt.cmdheight = 0
  vim.opt.formatoptions:append('M')
end
