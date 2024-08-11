{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    # extraConfig = builtins.readFile ../../shared/multiplexer/tmux.conf;
    shell = "${pkgs.fish}/bin/fish"; # NOTE :: not recommended to start tmux with fish shell ( bug where $PATH is not properly set for fish; https://github.com/LnL7/nix-darwin/issues/122 )
    extraConfig = ''
    set -g default-command "\${pkgs.fish}/bin/fish"
    ''
    + builtins.readFile ./tmux.conf;
  };
}
