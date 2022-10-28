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
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(), -- next suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- previous suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(4), -- scroll docs up
		["<C-f>"] = cmp.mapping.scroll_docs(-4), -- scroll docs down
		["<C-Space>"] = cmp.mapping.complete(), -- open completion suggestions
		["<C-e>"] = cmp.mapping.close(), -- close completion suggestions
		["<CR>"] = cmp.mapping.confirm({
			select = false,
		}),

		-- tab through items
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
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
