-- if exists('b:my_go_ftplugin')
--     finish
-- endif
--
-- let b:my_cpp_ftplugin = 1
-- let s:save_cpo = &cpoptions
-- set cpoptions&vim
--
-- nnoremap <m-r> <cmd>:AsyncRun make run<cr>
-- nnoremap <m-c> <cmd>:AsyncRun make build<cr>
-- nnoremap <m-s> <cmd>AsyncStop<cr>
--
-- setlocal tabstop=4 shiftwidth=4
-- setlocal conceallevel=0 concealcursor=nvic

vim.keymap.set('n', '<m-r>', function()
    vim.cmd('AsyncRun go run .')
end)

vim.keymap.set('n', '<m-c>', function()
    vim.cmd('AsyncRun go build .')
end)

vim.keymap.set('n', '<m-s>', function()
    vim.cmd('AsyncStop')
end)

vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.expandtab = false
