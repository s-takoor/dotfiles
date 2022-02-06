local g = vim.g

g.nvim_tree_width = 20
g.nvim_tree_indent_markers = 1
require'nvim-tree'.setup {
  auto_open = true,
  auto_close = false,
}
