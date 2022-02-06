-- Global options
vim.o.autoindent = true
vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 1
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.fillchars = "fold: "
vim.o.foldlevel = 99
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.mouse = "a"
vim.o.pumheight = 10
vim.o.scrolloff = 5
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.timeoutlen = 100
vim.o.updatetime = 300
vim.o.writebackup = false
vim.o.termguicolors = true

-- Buffer options
vim.bo.autoindent = true
vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.tabstop = 2

-- Window options
vim.wo.foldmethod   = "expr"
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

-- Theme
vim.cmd('colorscheme gruvbox-material')


