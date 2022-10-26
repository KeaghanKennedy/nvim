local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end

local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then
  return
end

local check_backspace = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Use luasnip
    end,
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(), -- Next suggestion
		['<C-j>'] = cmp.mapping.select_next_item(), -- Previous suggestion
    ['<C-Space>'] = cmp.mapping.complete(),     -- Open completion suggestions
    ['<C-e>'] = cmp.mapping.close(),            -- Open completion suggestions
    ['<C-y>'] = cmp.config.disable,             -- Disable default CTRL + y behaviour

    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },

    -- Tab through items
    ['<Tab>'] = cmp.mapping(function(fallback)
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
    end, { 'i', 's', }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's', }),
  },
  -- Sources have an order of precedence. Here, snippets will be suggested, then lsp suggestions, then buffer suggestions
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  formatting = {
    format = lspkind.cmp_format({with_text = false, width = 50}),
  },
}

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemmKind CmpItemMenuDefault
]]



