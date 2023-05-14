return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  config = function()
    require("plugins.indent-blankline")
  end,
}
