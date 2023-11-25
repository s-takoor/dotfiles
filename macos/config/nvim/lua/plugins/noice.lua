return {
  "folke/noice.nvim",
  config = function()
    require("noice").setup({
      -- Your configuration options go here

      -- Example: Change the border character
      border = "rounded",

      -- Example: Customize the colors
      colors = {
        background = "#1E222A",
        border = "#4D545E",
        title = "#61AFEF",
        message = "#D19A66",
      },

      -- Example: Set the position of the notification
      position = "top_right",

      -- Example: Disable default mappings
      disable_default_mappings = false,

      -- Example: Change the default timeout
      default_timeout = 5000,
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
}

