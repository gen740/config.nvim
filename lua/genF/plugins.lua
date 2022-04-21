-- Auto Packer Install Start
local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])
if not packer_exists then
    if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
        return
    end
    local directory = string.format("%s/site/pack/packer/opt/", vim.fn.stdpath("data"))
    vim.fn.mkdir(directory, "p")
    local out = vim.fn.system(
        string.format("git clone %s %s", "https://github.com/wbthomason/packer.nvim", directory .. "/packer.nvim")
    )
    print(out)
    print("Downloading packer.nvim...")
    return
end

local myConf = require("genF.options")

require("packer").startup {
    function(use)
        --------------------------------------------------------------------------------------------
        ---- Packer --------------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use { "wbthomason/packer.nvim", opt = true }

        --------------------------------------------------------------------------------------------
        ---- Utilities -----------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use { "vim-denops/denops.vim", opt = true }
        use { "cohama/lexima.vim", config = M.lexima_init, event = "User load_plugins" }
        use { "machakann/vim-sandwich", event = "User load_plugins" }
        use { "skywind3000/asyncrun.vim", cmd = { "AsyncRun" } }
        use { "easymotion/vim-easymotion", event = "User load_plugins" }
        use { "numToStr/Comment.nvim", config = function() require("Comment").setup() end, event = "User load_plugins" }
        use { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim", config = myConf.gitsigns, event = "User load_plugins" }
        use { "tpope/vim-fugitive", cmd = "Git" }
        use { "chentau/marks.nvim" }
        use { "lukas-reineke/indent-blankline.nvim", config = myConf.indent_blankline }
        use { "akinsho/nvim-toggleterm.lua", config = myConf.toggle_term, cmd = { "ToggleTerm" } }
        use { "mbbill/undotree", cmd = "UndotreeToggle" }
        use { "andymass/vim-matchup", event = "User load_plugins" }
        use { "folke/zen-mode.nvim", config = myConf.Zen_init, cmd = { "ZenMode" } }
        use { "petertriho/nvim-scrollbar", config = function() require("scrollbar").setup() end,
            key = { "j", "k", "<up>", "<down>", "<c-u>", "<c-d>", "<c-f>", "<c-b>" } }
        use { "tversteeg/registers.nvim", event = "User load_plugins" }
        use { "justinmk/vim-sneak", key = { "f", "F" } }

        --------------------------------------------------------------------------------------------
        ---- Treesitter ----------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use {
            "nvim-treesitter/nvim-treesitter",
            requires = {
                "nvim-treesitter/nvim-treesitter-textobjects",
                "nvim-treesitter/nvim-treesitter-refactor",
                "yioneko/nvim-yati",
                "nvim-treesitter/playground"
            },
            config = myConf.treesitter,
        }
        -- use { 'romgrk/nvim-treesitter-context', config = myConf.treesitter_context }

        --------------------------------------------------------------------------------------------
        ---- Appearance ----------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        -- use { "marko-cerovac/material.nvim" }
        -- use { "kyazdani42/blue-moon" }
        -- use { "mhartington/oceanic-next" }
        -- use { "sainnhe/everforest" }
        -- use { "kvrohit/substrata.nvim" }
        -- use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
        use { "EdenEast/nightfox.nvim" }
        use { "akinsho/nvim-bufferline.lua", requires = { "kyazdani42/nvim-web-devicons", opt = true }, config = myConf.bufferline }
        use { "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true }, config = myConf.lualine }
        use { "SirVer/ultisnips", requires = { "honza/vim-snippets" } }

        --------------------------------------------------------------------------------------------
        ---- File Operations -----------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }, config = myConf.nvim_tree, cmd = { "NvimTreeToggle" } }
        use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" }, config = myConf.telescope, event = "User load_plugins" }
        use { "nvim-telescope/telescope-fzf-native.nvim", requires = "junegunn/fzf", run = "make", }

        --------------------------------------------------------------------------------------------
        ---- FileType Plugins ----------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use { "rhysd/vim-grammarous", ft = { "markdown", "md", "text" } }
        use { "chrisbra/csv.vim", ft = { "csv", "tsv" } }
        use { "junegunn/goyo.vim", ft = { "text", "markdown", "md" } }
        use { "mattn/emmet-vim", ft = { "html", "markdown", "md" } }
        use { "tomlion/vim-solidity", ft = { "solidity" } }
        use { "lervag/vimtex", ft = { "markdown", "md", "tex" } }
        use { "fuenor/JpFormat.vim", ft = { "text" } }
        use { "rust-lang/rust.vim", ft = { "rust" } }
        use { "chikamichi/mediawiki.vim", ft = { "mediawikix" } }
        use { "KeitaNakamura/tex-conceal.vim", config = function() vim.g.tex_conceal_frac = 1 end, ft = { "latex" } }
        use { requires = { "kana/vim-textobj-user" }, "rbonvall/vim-textobj-latex", ft = { "latex" } }

        --------------------------------------------------------------------------------------------
        ---- LSP and Debugger ----------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        use { "neovim/nvim-lspconfig", config = myConf.nvim_lsp, event = "User load_plugins" }
        use { "williamboman/nvim-lsp-installer", config = myConf.LspInstaller, event = "User load_plugins" }
        use { "jose-elias-alvarez/null-ls.nvim", config = myConf.null_ls, event = "User load_plugins" }
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                { "onsails/lspkind-nvim" },
                { "hrsh7th/cmp-buffer", event = "User load_plugins" },
                { "hrsh7th/cmp-nvim-lsp", event = "User load_plugins" },
                { "hrsh7th/cmp-nvim-lsp-signature-help", event = "User load_plugins" },
                { "hrsh7th/cmp-nvim-lsp-document-symbol", event = "User load_plugins" },
                { "hrsh7th/cmp-path", event = "User load_plugins" },
                { "hrsh7th/cmp-calc", event = "User load_plugins" },
                { "hrsh7th/cmp-cmdline", event = "User load_plugins" },
                { "quangnguyen30192/cmp-nvim-ultisnips", event = "User load_plugins" },
            },
            config = myConf.nvim_cmp,
        }
        use { "nvim-lua/lsp-status.nvim", config = myConf.lsp_status, event = "User load_plugins" }

        --------------------------------------------------------------------------------------------
        ---- Obsolete ------------------------------------------------------------------------------
        --------------------------------------------------------------------------------------------
        -- use{
        --     "RRethy/vim-hexokinase",
        --     run = "make hexokinase",
        --     config = function()
        --         vim.g.Hexokinase_highlighters = { "virtual" }
        --     end,
        --     cmd = { "HexokinaseToggle" },
        -- }
        -- use {
        --     "folke/trouble.nvim",
        --     requires = "kyazdani42/nvim-web-devicons",
        --     config = function()
        --         require("trouble").setup({})
        --     end,
        --     cmd = "TroubleToggle",
        -- }
        -- use { "junegunn/vim-easy-align" }
        -- use { "windwp/nvim-ts-autotag", config = function() require("nvim-ts-autotag").setup {} end }
        -- use { "mfussenegger/nvim-dap", config = myConf.nvim_dap }
        -- use { "rcarriga/nvim-dap-ui", config = myConf.dap_ui }
        -- use{
        --     "gen740/Preview.vim",
        --     requires = "vim-denops/denops.vim",
        --     run = "make install",
        -- }
        -- use { "github/copilot.vim" }
    end,
}

myConf.others()
