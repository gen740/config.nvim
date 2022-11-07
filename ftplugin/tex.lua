local function inverse_search_start()
  local uv = vim.loop

  local async_func = uv.new_async(vim.schedule_wrap(function(line, filename)
    vim.cmd('e ' .. filename)
    vim.cmd(line)
  end))

  uv.new_thread(function(async)
    while true do
      local file = io.open('/tmp/zathura_synctex')
      assert(file ~= nil, 'cannot open /tmp/zathura_synctex')
      local file_data = file:read('*a')
      file:close()

      file_data = vim.split(file_data, '\n')
      if file_data[1] == 'close' and file_data[2] == '' then
        return
      end
      async:send(file_data[1], file_data[2])
    end
  end, async_func)
end

function Inverse_search_stop()
  vim.fn.jobstart([[echo "close" > /tmp/zathura_synctex]])
end

local zathura_job = nil

vim.keymap.set('n', '<m-r>', function()
  vim.fn.system([[mkfifo /tmp/zathura_synctex]])
  zathura_job = vim.fn.jobstart(
    [[zathura -x 'zsh -c "echo \"%{line}\n%{input}\" > /tmp/zathura_synctex"' document.pdf]]
  )
  inverse_search_start()
end)

vim.keymap.set('n', '<m-c>', function()
  vim.cmd('Run lualatex --file-line-error -synctex=1 -interaction=batchmode document.tex')
end)

vim.keymap.set('n', '<m-s>', function()
  if zathura_job ~= nil then
    Inverse_search_stop()
    vim.fn.jobstop(zathura_job)
  end
end)

vim.keymap.set('n', '<leader>s', function()
  vim.fn.jobstart(
    'zathura --synctex-forward '
      .. vim.fn.line('.')
      .. ':'
      .. vim.fn.col('.')
      .. ':'
      .. vim.fn.expand('%:p')
      .. ' '
      .. './document.pdf'
  )
end)

-- vim.keymap.set('n', '<leader>ls', Inverse_search_start)
-- vim.keymap.set('n', '<leader>lt', Inverse_search_stop)

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
  b = [[\beta]],
  c = [[\chi]],
  d = [[\delta]],
  e = [[\epsilon]],
  ve = [[\varepsilon]],
  m = [[\mu]],
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

-- set conceallevel=0
-- let g:tex_conceal='admgs'
-- let g:tex_fast= "MS"
-- " set conceallevel=0
-- " let g:tex_conceal=''
-- set concealcursor="invc"
-- hi Conceal guifg=#719cd6
