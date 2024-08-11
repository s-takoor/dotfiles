{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" "JetBrainsMono"  ]; })
  ];

  fonts.fontconfig.defaultFonts.monospace = [
    "JetBrainsMono Nerd Font"
    "Iosevka Nerd Font"
  ];
}
