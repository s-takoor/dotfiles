local wezterm = require("wezterm")

return {

  -- gpu acceleration provided by "metal" on macos
  front_end = "WebGpu",

  -- updates
  check_for_updates = true,

  -- scrollback
  scrollback_lines = 3500,

  -- multiplexer REVIEW :: hardcoded path for `tmux`
  default_prog = { "/etc/profiles/per-user/st/bin/tmux", "new-session", "-A", "-D", "-s", "main" },

  -- colors
  color_scheme = "Gruvbox Dark (Gogh)",
  -- color_scheme = "Catppuccin Macchiato",

  -- cursor blink
  default_cursor_style = "BlinkingBar",

  -- font
  font = wezterm.font_with_fallback({
      { family = "JetBrainsMono NF", weight = "Medium", italic = false, },
      { family = "SF Pro", weight = "Medium", italic = false, },
  }),
  font_size = 10.0,

  -- opacity
  window_background_opacity = 0.70,

  -- blur
  macos_window_background_blur = 30,

  -- padding
  window_padding = {
    left = 40,
    right = 40,
    top = 40,
    bottom = 40,
  },

  inactive_pane_hsb = {
    saturation = 0.24,
    brightness = 0.5,
  },

  -- window decorations
  window_decorations = "RESIZE",

  -- tab bar
  enable_tab_bar = false,

  -- keybindings
  keys = {
    {
      key = "f",
      mods = "CTRL",
      action = wezterm.action.ToggleFullScreen,
    },
  },
}
