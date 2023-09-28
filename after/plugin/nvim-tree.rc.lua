local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	view = {
		width = 75,
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	-- open in dir containing focused file
	update_focused_file = {
		enable = true,
		update_root = false,
		ignore_list = {},
	},
	-- show lsp diagnostics
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
