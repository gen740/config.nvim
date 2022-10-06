-- set conceallevel=0
-- let g:tex_conceal='admgs'
-- let g:tex_fast= "MS"
-- " set conceallevel=0
-- " let g:tex_conceal=''
-- set concealcursor="invc"
-- hi Conceal guifg=#719cd6

vim.keymap.set('n', '<m-r>', function()
  vim.fn.system('open -a /Applications/LivePDFviewer.app document.pdf')
  -- vim.cmd('Run luatex document.tex')
end)

vim.keymap.set('n', '<m-c>', function()
  vim.cmd('Run lualatex --file-line-error -interaction=batchmode document.tex')
end)

vim.keymap.set('n', '<m-s>', function()
  vim.cmd('Stop')
end)

vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2

local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'FileType tex' }, {
  callback = function()
    vim.g.lexima_enable_basic_rules = 0
    vim.g.lexima_enable_newline_rules = 0
    vim.g.lexima_enable_endwise_rules = 0
    vim.api.nvim_call_function('lexima#set_default_rules', {})
  end,
})

--
local special_key = {
  a = [[\alpha]],
  b = [[\bete]],
  c = [[\chi]],
  d = [[\delta]],
  e = [[\epsilon]],
  u = [[\mu]],
  n = [[\nu]],
  o = [[\omega]],
  ph = [[\phi]],
  ps = [[\psi]],
  hb = [[\hbar]],
}

special_key['%'] = [[\%]]

for name, val in pairs(special_key) do
  vim.keymap.set('i', '%' .. name, val)
end
