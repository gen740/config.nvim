--┼───────────────────────────────────────────────────────────────────────────────────────┼
--│ {{{                              « Vim Options »                                      │
--┼───────────────────────────────────────────────────────────────────────────────────────┼
vim.cmd 'packadd! matchit'
vim.cmd 'colo gruvbox'
vim.cmd [[set fillchars+=vert:\ ]]
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.backupext = '.bak'
vim.opt.clipboard = 'unnamed'
vim.opt.colorcolumn = '100'
vim.opt.completeopt:remove('preview')
vim.opt.conceallevel = 1
vim.opt.cursorline = true
vim.opt.display = 'lastline'
vim.opt.exrc = true
vim.opt.foldenable = true
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 999
vim.opt.foldmethod = 'expr'
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.iskeyword:remove(':')
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.listchars = [[tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%]]
vim.opt.matchtime = 5
vim.opt.modeline = true
vim.opt.number = true
vim.opt.path:append([[**]])
vim.opt.pumheight = 12
vim.opt.relativenumber = true
vim.opt.runtimepath:append('~/.vim/custom_runtime')
vim.opt.scrolloff = 8
vim.opt.shada = [['1000,f1,<500,:500,@500,/500]]
vim.opt.shortmess:append('c')
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tags = '.tags;~'
vim.opt.termguicolors = true
vim.cmd [[set undodir=~/.vim/undo]]
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.updatetime = 300
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.wildmenu = true
vim.opt.wildmode:append([[full]])
vim.opt.wildmode:append([[longest]])
vim.opt.writebackup = false

vim.g.python_host_prog='~/.pyenv/versions/neovim-2/bin/python'
vim.g.python3_host_prog='~/.pyenv/versions/neovim-3/bin/python' 

-- }}}

-- ┼───────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                              « AutoCommands »                                     │
-- ┼───────────────────────────────────────────────────────────────────────────────────────┼
vim.cmd [[
autocmd BufEnter,FocusGained,InsertLeave * set cursorline
autocmd BufLeave,FocusLost,InsertEnter   * set nocursorline
autocmd ColorScheme * highlight Normal guibg=none
autocmd ColorScheme * highlight SignColumn guibg=none
autocmd ColorScheme * highlight EndOfBuffer guifg=#222222
autocmd BufRead,BufNewFile *.[ch] nmap <silent><buffer> <Leader>f :silent CFamilyFMT<CR>
autocmd BufRead,BufNewFile *.[chi]pp nmap <buffer> <Leader>f :silent CFamilyFMT<CR>
autocmd FileType python nmap <buffer> <Leader>f :silen PEPFMT<CR>
autocmd FileType python compiler python
autocmd FileType qf setlocal nocursorline nonu norelativenumber
autocmd BufRead,BufNewFile *.rlib nmap <buffer> <Leader>f :silent RustFMT<CR>
autocmd BufRead,BufNewFile *.rs nmap <buffer> <Leader>f :silent RustFMT<CR>
autocmd BufRead,BufNewFile *.tex nmap <Leader>r <Leader>ll<Leader>lv
autocmd BufRead,BufNewFile *.tex setlocal filetype=tex
autocmd BufRead,BufNewFile *.wiki setlocal filetype=tex
autocmd BufRead,BufNewFile *.tex nnoremap <C-q> <Plug>Tex_FastEnvironmentInsert
autocmd BufRead,BufNewFile *.tex vnoremap <C-q> <Plug>Tex_FastEnvironmentInsert
autocmd TermOpen * setlocal nonumber norelativenumber
]]
-- autocmd BufRead,BufNewFile *.cpp syntax match Entity "main" conceal cchar=
-- }}}

-- ┼───────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                         « Indent Configurations »                                 │
-- ┼───────────────────────────────────────────────────────────────────────────────────────┼
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.cmd [[
augroup fileTypeIndent
  autocmd!
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType markdown setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
  autocmd FileType markdown setlocal filetype=markdown
  autocmd FileType markdown nnoremap o A<CR>
  autocmd FileType qf setlocal wrap
  autocmd FileType text setlocal tabstop=4 softtabstop=4 shiftwidth=4 wrap
  autocmd FileType rust let g:rust_recommended_style = 1
  autocmd FileType rust let g:rustfmt_autosave = 1
  autocmd FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4
augroup END  ]]
--- }}}
-- ┼───────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                               « Treesitter »                                      │
-- ┼───────────────────────────────────────────────────────────────────────────────────────┼
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true              -- false will disable the whole extension
  },
  indent = {
    enable = false,              -- false will disable the whole extension
  -- disable = { "c", "cpp", "python"},
  },
  incremental_selection = {
    enable = true              -- false will disable the whole extension
  },
  textobjects = {
    select = {
    enable = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      -- Or you can define your own textobjects like this
      ["iF"] = {
        python = "(function_definition) @function",
        cpp = "(function_definition) @function",
        c = "(function_definition) @function",
        java = "(method_declaration) @function",
        },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>sp"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>sP"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  refactor = {
    -- highlight_definitions = { enable = true },
    -- highlight_current_scope = { enable = true },
    -- smart_rename = {
     -- enable = false,
     -- keymaps = {
       -- smart_rename = "grr",
     -- },
   -- },
  },
}

-- }}}
-- ┼───────────────────────────────────────────────────────────────────────────────────────┼
-- │ {{{                        « Telescope Configurations »                               │
-- ┼───────────────────────────────────────────────────────────────────────────────────────┼
require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
            },
        prompt_prefix = '  ',
        layout_config = {
            prompt_position = 'top',
            width = 0.8,
            },
        selection_caret = " ▶ ",
        entry_prefix = "   ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        border = {},
        -- borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        -- borderchars = {
        --     prompt = {"─", "│", " ", "│", '┌', '┬', "│", "│"},
        --     results = {"─", "│", "─", "│", "├", "┤", "┴", "└"},
        --     preview = { '─', '│', '─', ' ', '─', '┐', '┘', '─'},
        -- },
        color_devicons = true,
        use_less = true,
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
require('telescope').load_extension('vim_bookmarks')
-- }}}
