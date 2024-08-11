{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f";
    defaultOptions = [
     "--height 50%"
     "--exact"
     "--reverse"
     "--border rounded"
     "--no-info"
     "--pointer '> '"
     "--ansi"
     "--color '16,bg+:-1,gutter:-1,prompt:4,pointer:4,marker:6,border:4,label:4,header:italic'"
    ];

    # opt-c for changing directory
    changeDirWidgetCommand = "fd --type d --hidden --exclude .git";
    changeDirWidgetOptions = [
      "--border-label ' directory '"
      "--preview 'eza -aT --icons --color=always {} | head -200'"
    ];

    # ctrl-t keybinding
    fileWidgetCommand = "fd --type f --hidden --exclude .git";
    fileWidgetOptions = [
      "--border-label ' file '"
      # "--prompt ' '"
      "--preview 'bat --style=numbers --color=always {}'"
    ];

    # ctrl-r
    historyWidgetOptions = [
      "--border-label ' history '"
      # "--prompt ' '"
      "--sort"
      "--exact"
    ];
    tmux = {
      enableShellIntegration = true;
      shellIntegrationOptions = [
        "-p 70%,50%"
      ];
    };
  };
}
