{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    # shell script code called during interactive `fish` shell initialisation
    interactiveShellInit = ''
    # -- shell settings -- #
    set fish_greeting
    fish_vi_key_bindings
    set fish_cursor_default     block      blink
    set fish_cursor_insert      line       blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual      block      blink
    '';

    # shell script code called during `fish` login shell initialisation
    # shellInit = ''
    # # -- HOMEBREW PATHS -- #
    # set -ga PATH /opt/homebrew/bin /opt/homebrew/sbin $PATH
    # set -gx HOMEBREW_PREFIX /opt/homebrew
    # set -gx HOMEBREW_CELLAR /opt/homebrew/Cellar/
    # set -gx INFOPATH /opt/homebrew/share/info $INFOPATH
    # set -gx MANPATH /opt/homebrew/share/man $MANPATH

    # # -- EMACS PATH -- #
    # set -gx PATH "$HOME/.emacs.d/bin" $PATH

    # # -- NIX PATH -- #
    # # HACK :: required to address bug where $PATH is not properly set for fish; ( https://github.com/LnL7/nix-darwin/issues/122 )
    # for p in /run/current-system/sw/bin ~/bin
    # if not contains $p $fish_user_paths
    #     set -g fish_user_paths $p $fish_user_paths
    # end
    # end
    # '';

    # attribute set that map `aliases` to `abbreviations`
    shellAbbrs = {
      list = "brew list";
      purge = "brew cleanup --prune=all";
      cat = "bat";
      cd = "z";
      cp = "xcp";
      df = "df -h";
      la = "eza -a";
      ll = "eza -l";
      ls = "eza -al";
      lt = "eza -aT";
      nm = "nmap -sC -sV -vvv -oN nmap-results";
      vi = "nvim";
    };

    # basic functions added to `fish`
    functions = {
      update = ''
      brew update
      brew upgrade --greedy-auto-updates
      brew cleanup --prune=all
      brew doctor
      '';
    };
  };
}
