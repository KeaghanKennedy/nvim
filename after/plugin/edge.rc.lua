vim.g.edge_style = "aura"
vim.g.edge_better_performance = 1

local status_ok,_  = pcall(vim.cmd, "colorscheme edge")
if not status_ok then
  vim.notify("Edge color scheme not installed. Add sainnhe/edge to your list of plugins.")
  return
end
