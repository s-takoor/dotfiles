return {
  {
    "nvim-treesitter/nvim-treesitter",
    build= ":TSUpdate",
    config = function ()
      local ts = require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "c",
          "comment",
          "cpp",
          "css",
          "diff",
          "graphql",
          "hcl",
          "html",
          "http",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "python",
          "query",
          "regex",
          "rust",
          "terraform",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
        autopairs  = { enable = true },
        context_commentstring = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "false",
            node_decremental = "<bs>",
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
            }
          }
        }
      })
    end,
  },
}
