{ ... }:

{
  # configures the skhd service to enable custom hotkeys on macos
  services.skhd = {
      enable = true;
      skhdConfig = ''
      shift + cmd - return : open -a wezterm # opens wezterm
      shift + cmd - a : open -na "arc" # opens arc browser
      shift + cmd - r : open -na "Brave Browser" # opens brave browser
      shift + cmd - e : emacsclient -c -n -a "" # opens emacs client in a new frame
      ctrl + alt - p : mpc toggle # toggles playback in mpd (mpc)
      ctrl + alt - f : mpc next # skips to the next tracj in mpd
      ctrl + alt - b : mpc prev # skips to previous track in mpd
    '';
    };
}
