return {
   {
      "nvim-telescope/telescope.nvim",
      version = "*",
      dependencies = { 
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons",
      },
      init = function()
         local telescope = require("telescope")
         local actions = require("telescope.actions")
         local previewers = require("telescope.previewers")

         telescope.setup({
            defaults = {
               mappings = {
                  i = {
                     ["<C-j>"] = actions.move_selection_next,
                     ["<C-k>"] = actions.move_selection_previous,
                  },
                  n = {
                     ["<C-j>"] = actions.move_selection_next,
                     ["<C-k>"] = actions.move_selection_previous,
                  },
               },
               layout_config = {
                  width = 0.75,
                  height = 0.85,
                  prompt_position = "top",
                  horizontal = {
                     preview_width = function(_, cols, _)
                        return math.floor(cols * 0.6)
                     end,
                  },
               },
               file_previewer = previewers.cat.new,
               grep_previewer = previewers.vimgrep.new,
               qflist_previewer = previewers.qflist.new,
            },
         })

         local builtin = require("telescope.builtin")

         vim.keymap.set("n", "<Leader>ff", function() builtin.find_files({ find_command = { 'rg', '--files', '--hidden', '--no-ignore', '--follow' } }) end, { noremap = true, silent = true })
         vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { noremap = true, silent = true })
         vim.keymap.set("n", "<Leader>fb", builtin.buffers, { noremap = true, silent = true })
         vim.keymap.set("n", "<Leader>fh", builtin.help_tags, { noremap = true, silent = true })
         vim.keymap.set("n", "<Leader>fc", builtin.git_commits, { noremap = true, silent = true })
         vim.keymap.set("n", "<Leader>fs", builtin.git_status, { noremap = true, silent = true })
      end,
   },
}

