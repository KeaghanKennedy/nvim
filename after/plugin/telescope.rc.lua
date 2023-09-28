local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
	print("telescope not installed")
	return
end

local actions_status_ok, actions = pcall(require, "telescope.actions")
if not actions_status_ok then
	print("telescope.actions could not be loaded")
	return
end

local builtin_status_ok, builtin = pcall(require, "telescope.builtin")
if not builtin_status_ok then
	print("telescope.builtin could not be loaded")
	return
end

telescope.setup({
	defaults = {
		layout_strategy = "vertical",
		winblend = 5,
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-i>"] = actions.preview_scrolling_up, -- scroll preview up
				["<C-u>"] = actions.preview_scrolling_down, -- scroll preview down
				["<C-Up>"] = actions.cycle_history_prev, -- fill prev search in history
				["<C-Down>"] = actions.cycle_history_next, -- fill next search in history
				["<C-d>"] = actions.delete_buffer, -- delete buffer
				["<esc>"] = actions.close, -- close on single esc
			},
		},
	},
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, {}) -- fine file
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {}) -- find string
vim.keymap.set("n", "<leader>fc", builtin.grep_string, {}) -- find string under cursor
vim.keymap.set("n", "<leader>fb", builtin.buffers, {}) -- find buffer
vim.keymap.set("n", "<leader>fr", builtin.registers, {}) -- find register

telescope.load_extension("fzf")
