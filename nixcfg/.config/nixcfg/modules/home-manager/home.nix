{ pkgs, ... }:

{
  imports = [
    # TODO :: to further modularize with `mkEnableOption` for toggling programs )
    ./programs/alacritty
    ./programs/bat
    ./programs/bun
    ./programs/direnv
    ./programs/eza
    ./programs/fd
    ./programs/fish
    ./programs/fzf
    ./programs/mise
    ./programs/nix-index
    # ./programs/nixvim # REVIEW :: disabled for now ( error: Alias @astrojs/language-server is still in node-packages.nix ) [https://github.com/NixOS/nixpkgs/issues/333677]
    ./programs/starship
    ./programs/thefuck
    ./programs/tmux
    ./programs/wezterm
    ./programs/yazi
    ./programs/zoxide
    ./programs/zsh
    ../shared/fonts.nix
  ];

  home = {
    # state version to ensure compatibility with home manager updates
    # home manager can be updated without changing this value
    stateVersion = "24.05";
    file = {
      # TODO :: to include attribute set of files to link into the user home directory
      # keeping empty for now; to source `editor` and `window manager` at a later stage ( wip )
    };
    packages = pkgs.callPackage ../shared/packages.nix {}; # set of packages to appear in the user environment
  };

  # let home manager install and manage itself
  programs = {
    home-manager.enable = true;
  };
}
