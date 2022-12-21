local cmp_status_ok, gui = pcall(require, "guihua")

if not cmp_status_ok then
  return
end

gui.setup()

