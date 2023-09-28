local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	print("lualine not installed")
	return
end

lualine.setup()
