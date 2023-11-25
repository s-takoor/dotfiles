return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function ()
      local ts = require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "c",
          "comment",
          "cpp",
          "css",
          "graphql",
          "hcl",
          "http",
          "javascript",
          "json",
          "lua",
          "rust",
          "tsx",
          "vim",
          "terraform",
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        autopairs  = { enable = true },
        context_commentstring = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        refactor = {
          highlight_definitions = { enable = true },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = "grr",
            },
          },
          navigation = {
            enable = true,
            keymaps = {
              goto_definition = "gnd",
              list_definitions = "gnD",
            },
          },
        },
      })
    end,
  },
}
