{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = true;
      # shell = {
      #   program = "${pkgs.zsh}/bin/zsh";
      #   program = "${pkgs.tmux}/bin/tmux";
      #   args = [ "new-session" "-A" "-D" "-s" "dev" ];
      # };
      cursor = {
        unfocused_hollow = false;
      };
      cursor.style = {
        blinking = "On";
        shape = "Block";
      };
      font = {
        size = 10;
      };
      font.bold = {
        family = "JetBrainsMono NF";
        style = "Bold";
      };
      font.bold_italic = {
        family = "JetBrainsMono NF";
        style = "Bold Italic";
      };
      font.italic = {
        family = "JetBrainsMono NF";
        style = "Italic";
      };
      font.normal = {
        family = "JetBrainsMono NF";
        style = "Regular";
      };
      env = {
        TERM = "xterm-256color";
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      window = {
        blur = true;
        decorations = "buttonless";
        dynamic_title = false;
        opacity = 0.7;
        startup_mode = "Windowed";
      };
      window.dimensions = {
        columns = 200;
        lines = 50;
      };
      window.padding = {
        x = 40;
        y = 40;
      };
    };
  };
}
