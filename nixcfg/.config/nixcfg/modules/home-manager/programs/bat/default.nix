{ config, lib, pkgs, ... }:

{
  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
      color = "always";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batgrep
    ];
  };
}
