local status_ok, lspkind = pcall(require, "lspkind")
if not status_ok then
	print("lspkind not installed")
	return
end

lspkind.init({
	mode = "symbol", -- Define how annotations are shown
	preset = "codicons", -- Default symbol map

	-- override preset symbols
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = "",
	},
})
