local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print("packer not installed")
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- let packer manage itself
	use("nvim-lua/popup.nvim") -- lua implementation of popup api
	use("nvim-lua/plenary.nvim") -- common utilities

	-- general
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	-- colorschemes
	use("folke/tokyonight.nvim")

	-- window management
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("szw/vim-maximizer") -- maximizes and restore current window

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons") -- vscode like icons

	-- telescope
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- faster sorting

	-- lsp
	use("neovim/nvim-lspconfig") -- lsp configuration layer
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- lsp ui plugin
	use("williamboman/mason.nvim") -- installer for language servers/formatters
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/typescript.nvim") -- pimped out tsserver

	-- formatting/linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- null-ls mason integration

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- comments
	use("numToStr/Comment.nvim") -- comments
	use("JoosepAlviste/nvim-ts-context-commentstring") -- context based comments (for jsx/tsx)

	-- auto closing
	use("windwp/nvim-ts-autotag") -- auto close jsx tags
	use("windwp/nvim-autopairs") -- auto close brackets and quotes

	-- completion
	use("hrsh7th/nvim-cmp") -- completion engine
	use("hrsh7th/cmp-nvim-lsp") -- lsp completion source
	use("hrsh7th/cmp-buffer") -- buffer completion source
	use("saadparwaiz1/cmp_luasnip") -- luasnip completion source
	use("onsails/lspkind.nvim") -- vscode like pictograms

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- collection of useful snippets

	-- git
	use("lewis6991/gitsigns.nvim") -- git markers
	use("dinhhuy258/git.nvim") -- lua port of vim fugitive
end)
