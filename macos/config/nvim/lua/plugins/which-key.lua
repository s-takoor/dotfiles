return {
  "folke/which-key.nvim",
  opts = {
    plugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = false,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = true,
        g = false,
      },
    },
    key_labels = {
      ["<space>"] = "Space",
      ["<cr>"] = "Enter",
      ["<tab>"] = "Tab",
      ["<leader>"] = "Leader",
      ["<localleader>"] = "LocalLeader",
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", -- bottom, top, left, right
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 2, -- spacing between columns
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    triggers_blacklist = { -- list of mode that should never show which_key
      -- i = { "j", "k" },
      -- v = { "j", "k" },
    },
    static = false, -- let which-key ignore all default mappings and create the missing ones itself
    on_config_done = nil, -- call a function after the config is setup
  },
}

