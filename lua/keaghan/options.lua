local opt = vim.opt

-- line numbers
opt.number = true -- set numbered lines
opt.relativenumber = true -- set relative numbered lines

-- tabs & indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.expandtab = true -- convert tabs to spaces
opt.autoindent = true -- autoindent new lines

opt.wrap = false -- don't wrap lines

-- searching
opt.ignorecase = true -- ignore case in search patterns
opt.hlsearch = false -- highlight all matches on previous search pattern
opt.smartcase = true -- smart case in search

-- appearance
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.background = "dark" -- default themes to dark
opt.cursorline = true -- highlight the current line
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.colorcolumn = "80" -- display ruler at 80th column

-- clipboard
opt.clipboard:append("unnamedplus") -- allow neovim to access the system clipboard

-- concatenate words around -
opt.iskeyword:append("-")

-- split windows
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window

-- scroll offsets
opt.scrolloff = 8 -- offset bottom scroll
opt.sidescrolloff = 8 -- offset side scroll
