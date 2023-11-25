return {
{ -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    config = function()
      vim.cmd.colorscheme 'onedark'
      vim.cmd('let g:onedark_termcolors=256')
    end,
  },
}
