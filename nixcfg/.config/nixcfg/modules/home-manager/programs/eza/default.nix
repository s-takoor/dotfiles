{ pkgs, ... }:

{
  programs.eza = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;
    icons = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
      "--color=always"
    ];
  };
}
