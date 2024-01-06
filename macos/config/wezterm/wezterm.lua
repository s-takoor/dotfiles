local wezterm = require("wezterm")
return {
  -- Updates
  check_for_updates = true,

  -- Scrollback
  scrollback_lines = 3500,

  -- Multiplexer
  default_prog = { "/opt/homebrew/bin/tmux", "new-session", "-A", "-D", "-s", "main" },

  -- Colors
  -- color_scheme = "Gruvbox Dark (Gogh)",
  color_scheme = "Catppuccin Macchiato",

  -- Cursor blink
  default_cursor_style = "BlinkingBar",

  -- Font
  font = wezterm.font("JetBrainsMono NF", { weight = "Medium", italic = false }),
  font_size = 11.0,

  -- Blur
  macos_window_background_blur = 20,

  inactive_pane_hsb = {
    saturation = 0.24,
    brightness = 0.5,
  },

  -- Padding
  window_padding = {
    left = 40,
    right = 40,
    top = 40,
    bottom = 40,
  },

  -- Opacity
  window_background_opacity = 0.70,
  window_decorations = "RESIZE",

  -- Tab bar
  enable_tab_bar = false,

  -- Keybindings
  keys = {
    {
      key = "f",
      mods = "CTRL",
      action = wezterm.action.ToggleFullScreen,
    },
  },
}
