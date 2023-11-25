-- Return the configuration for toggleterm
return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup{
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 1,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      -- Other configuration options...
    }
  end,
}

