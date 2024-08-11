{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh"; # directory where `zsh` configurations should be located
    autocd = true; # automatically enter into a directory if typed directly into shell
    autosuggestion = {
      enable = true;
      highlight = "fg=#b8bb26,bg=#ebdbb2,bold,underline";
    };
    enableCompletion = true; # enable `zsh` completion
    # initialization commands to run when completion is enabled
    completionInit = ''
    autoload -U compinit
    zstyle ':completion:*' menu select
    zstyle ':completion::complete:*' use-cache on
    zstyle ':completion::complete:*' cache-path "$dotDir/.zcompcache"
    zmodload zsh/complist
    compinit
    _comp_options+=(globdots)
    setopt menucomplete
    '';

    # REVIEW :: global setting; ( to make the env.vars available in other shell(s) as well e.g. fish )
    # envExtra = ''
    # # -- INITIALIZE HOMEBREW ENV -- #
    # eval "$(/opt/homebrew/bin/brew shellenv)"

    # # -- EMACS PATH -- #
    # export PATH="$HOME/.emacs.d/bin:$PATH"

    # # -- NIX PATHS -- #
    # export PATH="/run/current-system/sw/bin:/nix/var/nix/profiles/default/bin:$PATH"
    # export PATH="/etc/profiles/per-user/${config.home.username}/bin:$PATH"
    # '';

    # options related to commands history configuration
    history = {
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      extended = true;
      share = true;
      size = 100000;
      save = 100000;
    };

    # plugins to source in `.zshrc`
    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    # attribute set that maps aliases to command strings
    shellAliases = {
      cat = "bat";
      cd = "z";
      cp = "xcp";
      df = "df -h";
      la = "eza -a";
      ll = "eza -l";
      ls = "eza -al";
      lt = "eza -aT";
      vi = "nvim";
    };

    # enable syntax highlighting
    syntaxHighlighting = {
      enable = true;
      highlighters = [ "brackets" "cursor" "line" "main" "pattern" "regexp" "root" ];
    };
  };
}
