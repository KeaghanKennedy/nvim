local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	print("lspconfig not installed")
	return
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	print("cmp_nvim_lsp not installed")
	return
end

local typescript_status_ok, typescript = pcall(require, "typescript")
if not typescript_status_ok then
	print("typescript.nvim not installed")
	return
end

local keymap = vim.keymap

-- used to attatch keybinds after server becomes available
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	-- keep default jump to definition
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)

	-- typescript specific keymaps (e.g. rename file and update imports)
	-- if client.name == "tsserver" then
	-- 	keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports
	-- 	keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
	-- 	keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>") -- remove unused variables (not in youtube nvim video)
	-- end
end

-- used to enable autocompletion
local capabilities = cmp_nvim_lsp.default_capabilities()

typescript.setup({
	on_attach = on_attach,
	capabilties = capabilities,
})

lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilties = capabilities,
})

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilties = capabilities,
})

lspconfig.angularls.setup({
	on_attach = on_attach,
	capabilties = capabilities,
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			-- recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
