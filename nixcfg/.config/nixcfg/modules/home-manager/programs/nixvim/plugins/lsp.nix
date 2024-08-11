{
  programs.nixvim.plugins.lsp = {
    enable = true;

    keymaps = {
      silent = true;
      diagnostic = {
        "<leader>k" = "goto_prev";
        "<leader>j" = "goto_next";
      };

      lspBuf = {
        gd = "definition";
        gr = "references";
        gt = "type_definition";
        gi = "implementation";
        K = "hover";
        "<F2>" = "rename";
      };
    };

    servers = {
      clangd.enable = true;
      lua-ls.enable = true;
      nil-ls.enable = true;
      texlab.enable = true;
      yamlls.enable = true;
    };
  };
}
