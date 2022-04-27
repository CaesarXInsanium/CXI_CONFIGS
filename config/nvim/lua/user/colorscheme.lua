BASE16_ACTIVE = false
NVIM_THEME = "ayu-dark"
DRACULA_CUSTOM = false

DRACULA_CUSTOM_SCHEME = {
  bg = "#0f1419",
  fg = "#e6e1cf",
  selection = "#44475A",
  comment = "#6272A4",
  red = "#ff3333",
  orange = "#FFB86C",
  yellow = "#e7c547",
  green = "#b8cc52",
  purple = "#f07178",
  cyan = "#95e6cb",
  pink = "#FF79C6",
  bright_red = "#ff6565",
  bright_green = "#eafe84",
  bright_yellow = "#fff779",
  bright_blue = "#68d5ff",
  bright_magenta = "#ffa3aa",
  bright_cyan = "#c7fffd",
  bright_white = "#ffffff",
  menu = "#21222C",
  visual = "#3E4452",
  gutter_fg = "#4B5263",
  nontext = "#3B4048",
}

vim.o.background = "dark"
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.material_style = "deep ocean"
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_italic = true
vim.g.neon_style = "dark"
vim.g.dracula_show_end_of_buffer = true
vim.g.dracula_transparent_bg = true
vim.g.dracula_italic_comment = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. NVIM_THEME)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
