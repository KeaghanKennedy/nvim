local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	print("nvim-treesitter not installed")
	return
end

treesitter.setup({
	auto_install = true, -- automatically install missing parsers when entering buffer
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	context_commentsring = {
		enable = true,
		enable_autocmd = false,
	},
})
