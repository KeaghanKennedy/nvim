local status_ok, nvim_lsp = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
end

-- Require mason and mason-lspconfig BEFORE any lspconfig
require('mason').setup()
require('mason-lspconfig').setup()

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local capabilties = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    capabilties=capabilties
}

require('lspconfig')['sumneko_lua'].setup{
    on_attach = on_attach,
    capabilties=capabilties,
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'}
      },
    },
  },
}
