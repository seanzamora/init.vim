local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- print(install_path)
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


local status_ok, packer = pcall(require, "packer")

if not status_ok then
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use { "wbthomason/packer.nvim" }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end

    -- LSP & Autocomplete
    use { "neovim/nvim-lspconfig" }
    use { "simrat39/inlay-hints.nvim" }

    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-nvim-lua" }

    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }
    use { "VonHeikemen/lsp-zero.nvim", branch = "v3.x", requires = { "neovim/nvim-lspconfig" } }
    use { "lvimuser/lsp-inlayhints.nvim" }
    use { "simrat39/rust-tools.nvim" }
    use { "mfussenegger/nvim-dap" }
    use { "glepnir/lspsaga.nvim", after = 'nvim-lspconfig', config = function() require('lspsaga').setup({}) end }

    use { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } }
    -- Visual
    use { "nvim-tree/nvim-web-devicons" }
    use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }
    use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }
    use { "rose-pine/neovim", as = "rose-pine" }
    use { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} }

    -- Utils
    use { "nvim-lua/plenary.nvim" }
    use { "ThePrimeagen/harpoon", branch = "harpoon2", requires = { { "nvim-lua/plenary.nvim" } } }
    use { "numToStr/Comment.nvim" }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "tpope/vim-fugitive" }
    use { "nvim-telescope/telescope.nvim" }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use { "ojroques/nvim-osc52" }
    use { "akinsho/toggleterm.nvim" }
    use { "yarchived/wowlua.vim" }
    use { "tris203/precognition.nvim",
        event = "VeryLazy",
        opts  = {
            startVisible = true,
            showBlankVirtLine = true,
            highlightColor = { link = "VertSplit" },
            hints = {
                Caret = { text = "^", prio = 2 },
                Dollar = { text = "$", prio = 1 },
                MatchingPair = { text = "%", prio = 5 },
                Zero = { text = "0", prio = 1 },
                w = { text = "w", prio = 10 },
                b = { text = "b", prio = 9 },
                e = { text = "e", prio = 8 },
                W = { text = "W", prio = 7 },
                B = { text = "B", prio = 6 },
                E = { text = "E", prio = 5 },
            },
            gutterHints = {
                G = { text = "G", prio = 10 },
                gg = { text = "gg", prio = 9 },
                PrevParagraph = { text = "{", prio = 8 },
                NextParagraph = { text = "}", prio = 8 },
            },
            disabled_fts = {
                "startify",
            },
        }
    }
    use { "lukas-reineke/lsp-format.nvim" }

    use {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    }
end)
