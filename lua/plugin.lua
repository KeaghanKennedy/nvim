-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim' -- Tokyo night color scheme.
  use 'neovim/nvim-lspconfig' -- LSP.
  use "lukas-reineke/lsp-format.nvim" -- Async format on write.
end)
