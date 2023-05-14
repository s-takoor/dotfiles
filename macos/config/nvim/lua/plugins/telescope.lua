return {
   {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },

      init = function()
         local builtin = require("telescope.builtin")
         vim.keymap.set("n", "<Leader>ff", builtin.find_files, { noremap = true })
         vim.keymap.set("n", "<Leader>fb", builtin.buffers, { noremap = true })
         vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { noremap = true })
      end,
   }
}
