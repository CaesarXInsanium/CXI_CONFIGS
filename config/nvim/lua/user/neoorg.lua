local status, neorg = pcall(require, "neorg")

if not status then
  print("Neorg Failed")
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {}
  }
}
