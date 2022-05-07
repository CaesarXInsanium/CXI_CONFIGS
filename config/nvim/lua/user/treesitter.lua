local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = {"c", "lua",  "rust", "python", "cpp", "clojure", "cmake", "fish", "go", "http", "yaml", "toml", "julia", "latex", "llvm", "nix", "vim",  },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
     disable = { "markdown", "cpp"}, -- languages to disaple this functionality
    extended_mode = true,
    max_file_lines= nil
  },
  playground = {
    enable = true
  }
}
