local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	print("nvim-cmp not installed")
	return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	print("luasnip not installed")
	return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
	print("lspkind not installed")
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- use luasnip
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(), -- next suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- previous suggestion
		["<C-i>"] = cmp.mapping.scroll_docs(4), -- scroll docs up
		["<C-u>"] = cmp.mapping.scroll_docs(-4), -- scroll docs down
		["<C-e>"] = cmp.mapping.close(), -- close completion suggestions
		["<CR>"] = cmp.mapping.confirm({
			select = false,
		}),
	},
	-- sources declared in order of precedence
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp
		{ name = "luasnip" }, -- snippets
		{ name = "buffer" }, -- text within current buffer
	}),
	formatting = {
		format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "..." }),
	},
})
