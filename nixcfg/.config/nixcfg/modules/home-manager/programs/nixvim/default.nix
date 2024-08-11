{ inputs, lib, pkgs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./colorscheme.nix
    ./completion.nix
    ./keymaps.nix
    ./options.nix
    ./todo.nix
    ./plugins/auto-save.nix
    ./plugins/autopairs.nix
    ./plugins/barbar.nix
    ./plugins/colorizer.nix
    ./plugins/comment.nix
    ./plugins/lsp.nix
    ./plugins/lualine.nix
    ./plugins/noice.nix
    ./plugins/notify.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/trouble.nix
    ./plugins/vim-nix.nix
    ./plugins/which-key.nix
  ];

  programs.nixvim = {
    enable = true;

    performance = {
      byteCompileLua.enable = true;
    };

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
