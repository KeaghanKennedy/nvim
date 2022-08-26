-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer. Close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim ]]
end

local packer = require("packer")

-- Show packer in a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


return packer.startup(function(use)
  use 'wbthomason/packer.nvim'  -- Let packer manage itself
  use 'folke/tokyonight.nvim' -- Tokyo night color scheme
  use 'neovim/nvim-lspconfig' -- LSP
  use "lukas-reineke/lsp-format.nvim" -- Async format on write
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use "windwp/nvim-ts-autotag"
  use "windwp/nvim-autopairs"
  use 'nvim-lua/plenary.nvim' -- Common utilities

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
