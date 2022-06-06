local wezterm = require 'wezterm';
-- this is ligurature support test
-- >= == www *** %% ### ## # !=
return {
  color_scheme = "ayu",
  --font = wezterm.font("Cascadia Code Pl"),
  --font = wezterm.font("Iosevka SS18 Medium"),
  --font = wezterm.font("Anonymous Pro Minus"),
  --font = wezterm.font("Terminus"),
  font = wezterm.font("JetBrainsMono NF"),
  font_size = 11,
  window_background_opacity = 0.93,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  color_schemes = {
    ["jahy"] = {
      background = "#160c22",
      foreground = "#bcb2be",
      ansi = { "#160c22", "#963851", "#a95160", "#d8675b", "#e5be5d", "#e39767", "#796e87", "#bcb2be" },
      brights = { "#160c22", "#963851", "#a95160", "#d8675b", "#e5be5d", "#e39767", "#796e87", "#bcb2be" },
    }
  }
}
