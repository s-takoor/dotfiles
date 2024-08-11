{ pkgs, ... }:

{
  environment = {
    # list of permissible login shells ( available for all users )
    # these shells are added to `/etc/shells`
    shells = with pkgs; [
      bashInteractive
      fish
      zsh
    ];

    # system-wide paths or strings added to `PATH` environment variable ( available for all users )
    systemPath = [
      "/opt/homebrew/bin"
      "/opt/homebrew/sbin"
      "$HOME/.emacs.d/bin"
    ];

    # global environment variables ( available to all users )
    variables = {
      # uncomment and set the desired shell as required
      # SHELL = "${pkgs.bash}/bin/bash";
      # SHELL = "${pkgs.fish}/bin/fish";
      SHELL = "${pkgs.zsh}/bin/zsh";
    };
  };

  programs = with pkgs; {
    # enable various interactive shells to work with `nix-darwin`
    # NOTE :: the main configuration for these shells is managed by `home-manager`
    bash.enable = true;
    fish.enable = true;
    zsh.enable = true;
  };
}
