local myConf = require("genF.options")

-- Auto Packer Install
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

require("packer").startup({
    function(use)
        -- Packer -------------------------------------------------------------------------------------
        use({
            "wbthomason/packer.nvim",
        })

        -- None Regular -------------------------------------------------------------------------------
        use({
            "kana/vim-textobj-user",
        })
        use({
            "rbonvall/vim-textobj-latex",
        })

        -- Utilities ----------------------------------------------------------------------------------
        use({
            "vim-denops/denops.vim",
        })
        use({
            "RRethy/vim-hexokinase",
            run = "make hexokinase",
            config = function()
                vim.g.Hexokinase_highlighters = { "virtual" }
            end,
            cmd = { "HexokinaseToggle" },
        })
        use({
            "windwp/nvim-ts-autotag",
            config = function()
                require("nvim-ts-autotag").setup({
                    filetypes = { "tsx", "jsx", "html", "xml" },
                })
            end,
        })
        use({
            "cohama/lexima.vim",
            config = M.lexima_init,
        })
        use({
            "machakann/vim-sandwich",
        })
        use({
            "skywind3000/asyncrun.vim",
            cmd = { "AsyncRun", "Say" },
        })
        use({
            "kevinhwang91/nvim-bqf",
            requires = "junegunn/fzf",
            config = myConf.bqf,
            -- cmd = {'copen'}
        })
        use({
            "easymotion/vim-easymotion",
        })
        use({
            "junegunn/vim-easy-align",
        })
        use({
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end,
        })
        use({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = myConf.todo_comment,
        })
        use({
            "lewis6991/gitsigns.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = myConf.gitsigns,
        })
        use({
            "tpope/vim-fugitive",
            cmd = "Git",
        })
        use("kshenoy/vim-signature")
        use({
            "lukas-reineke/indent-blankline.nvim",
            config = myConf.indent_blankline,
        })
        use({
            "akinsho/nvim-toggleterm.lua",
            config = myConf.toggle_term,
        })
        use({
            "majutsushi/tagbar",
            cmd = "TagbarToggle",
        })
        use({
            "mbbill/undotree",
            cmd = "UndotreeToggle",
        })
        use({
            "andymass/vim-matchup",
        })
        use({
            "rcarriga/nvim-notify",
        })

        -- DashBoard ----------------------------------------------------------------------------------
        use({
            "glepnir/dashboard-nvim",
            config = myConf.dashboard,
        })

        -- Treesitter ---------------------------------------------------------------------------------
        use({
            "nvim-treesitter/nvim-treesitter",
            requires = {
                "nvim-treesitter/nvim-treesitter-textobjects",
                "nvim-treesitter/nvim-treesitter-refactor",
            },
            config = myConf.treesitter,
        })
        use({ "nvim-treesitter/playground" })

        -- Appearance ---------------------------------------------------------------------------------
        -- use({ "marko-cerovac/material.nvim" })
        -- use({ "kyazdani42/blue-moon" })
        -- use({ "mhartington/oceanic-next" })
        -- use({ "sainnhe/everforest" })
        -- use({ "kvrohit/substrata.nvim" })
        use({
            "ellisonleao/gruvbox.nvim",
            requires = { "rktjmp/lush.nvim" },
        })
        use({ "EdenEast/nightfox.nvim" })
        use({
            "akinsho/nvim-bufferline.lua",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
            config = myConf.bufferline,
        })
        use({
            "hoob3rt/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
            config = myConf.lualine,
        })
        use({
            "honza/vim-snippets",
            event = "VimEnter *",
        })
        use({
            "SirVer/ultisnips",
            event = "VimEnter *",
        })

        -- File Operations ----------------------------------------------------------------------------
        use({
            "kyazdani42/nvim-tree.lua",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = myConf.nvim_tree,
            cmd = "NvimTreeToggle",
        })
        use({
            "nvim-telescope/telescope.nvim",
            requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
            config = myConf.telescope,
            cmd = { "Telescope" },
        })
        use({
            "nvim-telescope/telescope-fzf-native.nvim",
            requires = "junegunn/fzf",
            run = "make",
        })

        -- FileType Plugins ---------------------------------------------------------------------------
        use({ "rhysd/vim-grammarous", ft = { "markdown", "md", "text" } })
        use({ "chrisbra/csv.vim", ft = { "csv", "tsv" } })
        use({ "junegunn/goyo.vim", ft = { "text", "markdown", "md" } })
        use({ "mattn/emmet-vim", ft = { "html", "markdown", "md" } })
        use({ "tomlion/vim-solidity", ft = { "solidity" } })
        use({ "lervag/vimtex", ft = { "markdown", "md", "tex" } })
        use({ "lvht/tagbar-markdown", ft = { "markdown", "md" } })
        use({ "plasticboy/vim-markdown", ft = { "markdown", "md" } })
        use({ "davidgranstrom/nvim-markdown-preview", ft = { "markdown", "md" } })
        use({ "fuenor/JpFormat.vim", ft = { "text" } })
        use({ "rust-lang/rust.vim", ft = { "rust" } })
        use({ "KeitaNakamura/tex-conceal.vim", ft = { "tex" } })
        use({ "chikamichi/mediawiki.vim", ft = { "mediawikix" } })

        -- LSP and Debugger ---------------------------------------------------------------------------
        use({
            "neovim/nvim-lspconfig",
            config = myConf.nvim_lsp,
        })
        use({
            "williamboman/nvim-lsp-installer",
            config = myConf.LspInstaller,
        })
        use({
            "jose-elias-alvarez/null-ls.nvim",
            config = myConf.null_ls,
        })
        -- use({ "github/copilot.vim" })
        -- use({ "mfussenegger/nvim-dap", config = myConf.nvim_dap })
        -- use({ "rcarriga/nvim-dap-ui", config = myConf.dap_ui })
        use({
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup({})
            end,
            cmd = "TroubleToggle",
        })

        use({
            "hrsh7th/nvim-cmp",
            requires = {
                {
                    "onsails/lspkind-nvim",
                    config = myConf.nvim_lspkind,
                },
                {
                    "hrsh7th/cmp-buffer",
                    event = "InsertEnter *",
                },
                {
                    "hrsh7th/cmp-nvim-lsp",
                    event = "InsertEnter *",
                },
                {
                    "hrsh7th/cmp-path",
                    event = "InsertEnter *",
                },
                {
                    "hrsh7th/cmp-calc",
                    event = "InsertEnter *",
                },
                {
                    "ray-x/cmp-treesitter",
                    event = "InsertEnter *",
                },
                {
                    "quangnguyen30192/cmp-nvim-ultisnips",
                    event = "InsertEnter",
                },
            },
            config = myConf.nvim_cmp,
        })
        use({
            "nvim-lua/lsp-status.nvim",
            config = myConf.lsp_status,
        })
    end,

    config = {
        display = {
            open_fn = require("packer.util").float,
        },
        profile = {
            enable = true,
            threshold = 100,
        },
    },
})

myConf.others()
