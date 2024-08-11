{ pkgs, ... }:

{
  homebrew = {
    enable = true;
    global = {
      brewfile = true; # use the brewfile for managing homebrew packages
    };
    onActivation = {
      autoUpdate = true; # homebrew auto-update
      # cleanup = "zap"; NOTE :: uninstalls all formulae ( and associated files ) not listed in the brewfile ( &/or declared in the brews/casks.nix )
      upgrade = true; # upgrade all installed homebrew packages
      # flags to use for debugging
      # extraFlags = [
      #   "--verbose"
      #   "--debug"
      # ];
    };
    brews = pkgs.callPackage ./brews.nix {}; # homebrew formulae
    casks = pkgs.callPackage ./casks.nix {}; # homebrew casks
    taps = pkgs.callPackage ./taps.nix {}; # homebrew taps
    # masApps = pkgs.callPackage ./masApps.nix {}; # homebrew mac app store apps
  };
}
