local status, base16 = pcall(require, "mini.base16")

if not status then
  print("base16 could not be loaded")
  return
end

base16.setup({
  palette = {
    base00 = '#101010', base01 = '#38365c',
    base02 = '#514e85', base03 = '#6a66ad',
    base04 = '#837ed6', base05 = '#9c96ff',
    base06 = '#c3bfff', base07 = '#e9e8ff',
    base08 = '#515151', base09 = '#cf6169',
    base0A = '#61cf75', base0B = '#cfc661',
    base0C = '#4f49ac', base0D = '#cf61c5',
    base0E = '#61cdcf', base0F = '#b3fff3',

  }
})
