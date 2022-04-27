local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "nix", "fish" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp"}, -- languages to disaple this functionality
    extended_mode = true,
    max_file_lines= nil
  },
  playground = {
    enable = true
  }
}
