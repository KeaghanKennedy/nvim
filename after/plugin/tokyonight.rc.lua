local status_ok, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not status_ok then
	print("tokyonight not installed")
	return
end
