local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
	print("tokyonight not installed")
	return
end

tokyonight.setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		-- floats = "transparent",
	},
})

vim.cmd("colorscheme tokyonight")
