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
  use 'wbthomason/packer.nvim'          -- Let packer manage itself
  use 'nvim-lua/popup.nvim'             -- Lua implementation of popup api
  use 'nvim-lua/plenary.nvim'           -- Common utilities

  -- LSP
  use 'neovim/nvim-lspconfig'          
  use "lukas-reineke/lsp-format.nvim"   -- Async format on write
  
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use "windwp/nvim-ts-autotag"          -- Auto close jsx tags
  use "windwp/nvim-autopairs"           -- Auto close brackets and quotes

  -- Colorschemes
  use 'https://github.com/sainnhe/edge' -- Edge color scheme

  -- Completion
  use 'hrsh7th/nvim-cmp'                -- Completion plugin
  use 'hrsh7th/cmp-nvim-lsp'            -- 
  use 'hrsh7th/cmp-buffer'              -- Buffer completions
  use 'hrsh7th/cmp-path'                -- Path completions
  use 'hrsh7th/cmp-cmdline'             -- Command line completions
  use 'saadparwaiz1/cmp_luasnip'        -- Luasnip completions

  -- Snippets
  use 'L3MON4D3/LuaSnip'                -- Snippet engine
  use 'rafamadriz/friendly-snippets'    -- Snippet collection
  use 'onsails/lspkind.nvim'            -- VSCode like pictograms

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
