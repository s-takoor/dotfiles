return {
   "tpope/vim-fugitive",
   {
      "lewis6991/gitsigns.nvim",
      opts = {},
      init = function()
         local opt = { noremap = true, silent = true }
         vim.keymap.set("n", "<Leader>gs", ":Git<CR>", opt)
         vim.keymap.set("n", "<Leader>gl", ":Git log<CR>", opt)
         vim.keymap.set("n", "<Leader>ga", ":Git add .<CR>", opt)
         vim.keymap.set("n", "<Leader>gc", ":Git commit<CR>", opt)

         -- Interactive Rebase
         vim.keymap.set("n", "<Leader>gr", ":Git rebase -i HEAD^<CR>", opt)
         vim.keymap.set("n", "<Leader>gri", ":Git rebase -i<CR>", opt)

         -- Git Blame
         vim.keymap.set("n", "<Leader>gb", ":Git blame<CR>", opt)

         -- Gitsigns
         vim.keymap.set("n", "<Leader>gh", ":Gitsigns hunk preview<CR>", opt)
         vim.keymap.set("n", "<Leader>gd", ":Gitsigns diff preview<CR>", opt)

         -- Commit and Push
         vim.keymap.set("n", "<Leader>gcp", ":Git commit && Git push<CR>", opt)

         -- Branch Switching
         vim.keymap.set("n", "<Leader>gbn", ":Git checkout -<CR>", opt) -- Switch to the next branch
         vim.keymap.set("n", "<Leader>gbp", ":Git checkout -<CR>", opt) -- Switch to the previous branch

         -- Git Stash
         vim.keymap.set("n", "<Leader>gss", ":Git stash<CR>", opt) -- Stash changes
         vim.keymap.set("n", "<Leader>gsl", ":Git stash list<CR>", opt) -- List stashes
      end
   }
}

