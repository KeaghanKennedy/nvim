local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }


-- Diagnostic jump
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

-- Code action
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Rename
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Goto definition
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
-- Peek definition
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga peek_definition<CR>', opts)
-- Hover doc
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
-- Preview definition
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
