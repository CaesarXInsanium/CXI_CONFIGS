local wezterm = require 'wezterm';
-- this ligurature support test
-- >= == www *** %% ### ## # !=
return {
	color_scheme = "DoomOne",
  font = wezterm.font("Cascadia Code Pl"),
	--font = wezterm.font("Anonymous Pro Minus"),
  font_size = 11,
  window_background_opacity = 0.93,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
}
