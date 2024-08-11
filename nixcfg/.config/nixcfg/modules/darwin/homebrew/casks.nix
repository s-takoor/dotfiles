_:

[
  # browsers
  {
    name = "arc";
    greedy = true;
  }
  {
    name = "brave-browser";
    greedy = true;
  }

  # entertainment
  {
    name = "mpv"; # REVIEW :: ( media player for the command line - will move to home-manager when build failure for swift has been addressed )
    greedy = true;
  }

  # fonts ( used for sketchybar )
  "font-sf-mono"
  "font-sf-pro"
  "sf-symbols"

  # productivity
  "raycast" # better launcher for mac vs spotlight or alfred
  "maccy" # clipboard tool for history
  "iglance" # FOSS macos system monitor

  # tweaks
  "notunes"  # REVIEW :: ( was getting annoyed with apple music constantly popping-up due to core-audio setup in mpd.conf - core-audio issues with Hi-Res audio playback )

  # tiling window manager for macos ( without any security compromise "SIP" )
  {
    name = "amethyst";
    greedy = true;
  }
]
