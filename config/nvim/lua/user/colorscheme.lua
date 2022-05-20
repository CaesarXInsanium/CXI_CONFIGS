vim.o.background = "dark"
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.material_style = "deep ocean"
vim.g.nord_contrast = true
vim.g.nord_borders = false
vim.g.nord_italic = true
vim.g.neon_style = "dark"
vim.g.dracula_show_end_of_buffer = true
vim.g.dracula_transparent_bg = false
vim.g.dracula_italic_comment = true

NVIM_THEME = "doom-one"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. NVIM_THEME)
if not status_ok then
  vim.notify("colorscheme " .. NVIM_THEME.. " not found!")
  return
end
