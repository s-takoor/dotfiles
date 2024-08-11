{
  programs.nixvim = {
    opts = {
      autoindent = true;
      autowrite = true;
      backup = false;
      breakindent = true;
      clipboard = "unnamedplus";
      cursorcolumn = true;
      cursorline = true;
      expandtab = true;
      hlsearch = true;
      ignorecase = true;
      linebreak = true;
      mouse = "a";
      mousemodel = "extend";
      number = true;
      relativenumber = true;
      ruler = true;
      scrolloff = 10;
      shiftwidth = 4;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      softtabstop = 2;
      splitbelow = true;
      splitright = true;
      swapfile = false;
      tabstop = 4;
      termguicolors = true;
      undofile = true;
      updatetime = 100;
      wrap = true;
    };
  };
}
