
# TODO Comment
# test

<!-- TODO: This is TODO -->
<!-- FIX: This is FIX -->
<!-- HACK: This is Hack -->
<!-- WARN: This is Warn -->
<!-- PERF: This is Preference -->
<!-- NOTE: This is Note -->


-- file type plugin
-- vim.g.Imap_UsePlaceHolders = 0
-- vim.g.Imap_StickyPlaceHolders = 0
-- vim.g.suppress_latex_suite = 1
-- vim.cmd 'packadd! matchit'

vim.opt.runtimepath:append('~/.vim/JpFormat.vim')
-- vim.opt.formatexpr=[[jpfmt#formatexpr()]]
vim.opt.formatexpr=[[jpvim#formatexpr()]]
vim.g.jpvim_remove_youon = 1
vim.g.JpFormatCursorMovedI = 1
vim.g.jpfmt_paragraph_regexp = '-^[「'
vim.cmd [[au BufRead *.txt JpSetAutoFormat]]
vim.cmd [[au BufRead *.md JpSetAutoFormat]]

