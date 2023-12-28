local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

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

    -- LSP Autocomplete
    use { "neovim/nvim-lspconfig" }
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
    use { "VonHeikemen/lsp-zero.nvim", branch = "v1.x"  }

    use { "williamboman/mason.nvim" }

    -- Visual
    use { "nvim-tree/nvim-web-devicons" }
    use { "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" } }
    use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } }
	use { "rose-pine/neovim", as = "rose-pine" }

    -- Utils
    use { "nvim-lua/plenary.nvim" }
	use { "ThePrimeagen/harpoon", branch = "harpoon2", requires = { {"nvim-lua/plenary.nvim"} } }
    use { "numToStr/Comment.nvim" }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

end)
