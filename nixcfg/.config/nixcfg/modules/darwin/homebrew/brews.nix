_:

[
  "cidr" # perform various actions on `cidr` ranges
  {
    name = "emacs-plus"; # gnu-emacs for macos with additional functionalities over the regular emacs package
    args = [
      "with-native-comp"
      "with-modern-doom3-icon"
    ];
    link = true; # link the formulae to the homebrew prefix
  }
  "enchant"
  "ffmpeg"
  "imagemagick"
  "llvm"
  "mpc" # command-line client for music player daemon (mpd)
  {
    name = "mpd";
    restart_service = "changed"; # the version from home-manager is not supported for aarch64-darwin and there no mpd services in nix-darwin
  }
  "ncmpcpp" # visualizer_type spectrum error with home-manager
  "nmap"
  "pandoc"
  "pam-reattach" # module for re-attaching to the authenticating user's per-session bootstrap namespace on macos
  "texlive"
  "unar"
]
