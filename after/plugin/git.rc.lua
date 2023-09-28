local status_ok, git = pcall(require, "git")
if not status_ok then
	print("git.nvim not installed")
	return
end

git.setup({
	keymaps = {
		blame = "<Leader>gb",
		browse = "<Leader>go",
	},
})
