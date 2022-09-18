-- Auto Packer Install Start
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
    if vim.fn.input('Download Packer? (y for yes)') ~= 'y' then
        return
    end
    local directory = string.format('%s/site/pack/packer/opt/', vim.fn.stdpath('data'))
    vim.fn.mkdir(directory, 'p')
    local out = vim.fn.system(
        string.format('git clone %s %s', 'https://github.com/wbthomason/packer.nvim', directory .. '/packer.nvim')
    )
    print(out)
    print('Downloading packer.nvim...')
    return
end

require('packer').startup {
    function(use)
        --------------------------------------------------------------------------------------------
        ---- Packer --------------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use { 'wbthomason/packer.nvim', opt = true }

        --------------------------------------------------------------------------------------------
        ---- Utilities -----------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use { 'cohama/lexima.vim', config = require('genf.configs.lexima').setup }
        use { 'junegunn/vim-easy-align' }
        use { 'machakann/vim-sandwich', keys = { 'sa', 'sd', 'sr' } }

        use { 'numToStr/Comment.nvim', config = function() require('Comment').setup {} end, keys = "gc" }
        use { 'mbbill/undotree', cmd = 'UndotreeToggle' }
        use { 'andymass/vim-matchup' }
        use { 'tpope/vim-fugitive', cmd = 'Git' }
        use { 'nvim-lua/plenary.nvim' }
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = require('genf.configs.indent_blankline').setup
        }
        use {
            'SirVer/ultisnips',
            requires = { 'honza/vim-snippets' },
            config = require('genf.configs.ultisnips').setup
        }
        use { 'wakatime/vim-wakatime' }
        -- use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }
        use {
            "max397574/colortils.nvim",
            cmd = "Colortils",
            config = function()
                require("colortils").setup({})
            end,
        }

        --------------------------------------------------------------------------------------------
        ---- Treesitter ----------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use {
            'nvim-treesitter/nvim-treesitter',
            config = require('genf.configs.treesitter').setup,
        }
        use {
            'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle'
        }

        --------------------------------------------------------------------------------------------
        ---- Appearance ----------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        ---- Color Scheme
        use { 'EdenEast/nightfox.nvim', config = function() vim.cmd("colo nordfox") end }
        -- use { 'marko-cerovac/material.nvim' }
        -- use { 'kyazdani42/blue-moon' }
        -- use { 'mhartington/oceanic-next' }
        -- use { 'sainnhe/everforest' }
        -- use { 'kvrohit/substrata.nvim' }
        -- use { 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } }

        --------------------------------------------------------------------------------------------
        ---- File Operations -----------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use {
            'kyazdani42/nvim-tree.lua',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = require('genf.configs.nvim_tree').setup,
            cmd = { 'NvimTreeToggle' }
        }
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                {
                    'nvim-lua/popup.nvim',
                },
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    requires = 'junegunn/fzf',
                    run = 'make',
                }
            },
            config = require('genf.configs.telescope').setup,
            cmd = "Telescope"
        }

        --------------------------------------------------------------------------------------------
        ---- FileType Plugins ----------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use { 'rhysd/vim-grammarous', ft = { 'markdown', 'markdown', 'text' } }
        use { 'chrisbra/csv.vim', ft = { 'csv', 'tsv' } }
        use { 'mattn/emmet-vim', ft = { 'html', 'markdown', 'markdown' } }
        use { 'JoosepAlviste/nvim-ts-context-commentstring', config = function()
            require 'nvim-treesitter.configs'.setup {
                context_commentstring = {
                    enable = true
                }
            }
        end }
        use { 'windwp/nvim-ts-autotag', config = function() require('nvim-ts-autotag').setup {} end,
            ft = { 'html', 'js', 'ts' }
        }
        use { 'lervag/vimtex', ft = { 'markdown', 'tex' } }
        use { 'fuenor/JpFormat.vim', ft = { 'text', 'markdown' } }
        use { 'chikamichi/mediawiki.vim', ft = { 'mediawikix' } }
        -- use { 'rust-lang/rust.vim' }
        -- use { 'KeitaNakamura/tex-conceal.vim', config = function() vim.g.tex_conceal_frac = 1 end, ft = { 'latex' } }
        -- use { 'rbonvall/vim-textobj-latex', requires = { 'kana/vim-textobj-user' }, ft = { 'latex' } }

        --------------------------------------------------------------------------------------------
        ---- LSP and Debugger ----------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use {
            'neovim/nvim-lspconfig',
            requires = {
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
            },
            config = function()
                require('genf.configs.lsp').mason()
                require('genf.configs.lsp').nvim_lsp()
            end
        }
        use { 'lvimuser/lsp-inlayhints.nvim', config = require('genf.configs.lsp').inlay_hints }
        use { 'mfussenegger/nvim-dap', config = require('genf.configs.dap').nvim_dap }
        use { 'mfussenegger/nvim-dap-ui', config = require('genf.configs.dap').dap_ui }
        use {
            'hrsh7th/nvim-cmp',
            requires = {
                { 'onsails/lspkind-nvim' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lsp-signature-help' },
                { 'hrsh7th/cmp-nvim-lsp-document-symbol' },
                { 'hrsh7th/cmp-path', },
                { 'hrsh7th/cmp-calc' },
                { 'hrsh7th/cmp-cmdline' },
                { 'quangnguyen30192/cmp-nvim-ultisnips' },
                { 'neovim/nvim-lspconfig' },
            },
            config = require('genf.configs.nvim_cmp').nvim_cmp
        }
        use {
            'nvim-lua/lsp-status.nvim',
            config = require('genf.configs.statusline').lsp_status,
        }

        --------------------------------------------------------------------------------------------
        -- OBSOLETE --------------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        -- use { 'gen740/SmoothCursor.nvim',
        --     config = function()
        --         require('smoothcursor').setup()
        --     end
        -- }
        use {
            'gen740/SmoothCursor.nvim', config = function()
                require('smoothcursor').setup({
                    priority = 1,
                    autostart = true,
                    threshold = 1,
                    speed = 30,
                    type = "exp",
                    fancy = {
                        enable = true,
                        head = { cursor = nil },
                        body = {
                            -- { cursor = "", texthl = "SCWhite" },
                            { cursor = "●", texthl = "SCWhite" },
                            { cursor = "•", texthl = "SCWhite" },
                            { cursor = ".", texthl = "SCWhite" },
                        },
                    }
                })
            end
        }
        -- use { 'tversteeg/registers.nvim' }
        -- use { 'chentoast/marks.nvim', config = require('genf.configs.marks').marks }
        -- use {
        --     'lewis6991/gitsigns.nvim',
        --     config = require('genf.configs.gitsigns').setup,
        --     ft = { "cpp", "python", "go", "lua" }
        -- }
        -- use {
        --     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        --     config = function()
        --         require("lsp_lines").setup()
        --     end,
        -- }
        -- use { 'folke/zen-mode.nvim', config = require('genf.configs.zen').setup, cmd = { 'ZenMode' } }
    end,
}
