-- Tokyo Night
return {
  "folke/tokyonight.nvim",
  config = function()
    local is_transparent = true
    require("tokyonight").setup({
      transparent = is_transparent,
      style = "moon",
      styles = {
        sidebars = is_transparent and "transparent" or "dark",
        floats = is_transparent and "transparent" or "dark",
      },
    })
    vim.cmd.colorscheme("tokyonight")
  end,
}
