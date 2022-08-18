local on_attatch = function(client, bufnr)
  local bufopts = {noremap=true, silent=true, buffer=bufnr }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
end

require('lspconfig')['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags
}
