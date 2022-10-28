local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	print("nvim-autopairs not installed")
	return
end

autopairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})
