return {
   {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function ()
         require("nvim-treesitter.configs").setup({
            auto_install = true,
            ensure_installed = { "bash", "c", "comment", "cpp", "css", "graphql", "http", "javascript", "json", "lua", "rust", "tsx", "vim" },
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
         })
      end,
   },
}
