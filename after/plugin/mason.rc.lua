local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	print("mason not installed")
	return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	print("mason-lspconfig-lspconfig not installed")
	return
end

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
	print("mason-null-ls not installed")
	return
end

mason.setup()

-- langauge server setup
mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
	},
	automatic_installation = true, -- automatically install configured servers
})

-- formatter & linter setup
mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
	automatic_installation = true, -- automatically install configured linters
})
