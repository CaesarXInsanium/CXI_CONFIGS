local alpha    = require('alpha')
local startify = require 'alpha.themes.startify'

startify.section.header.val         = {
  [[ _       __     __                               _______  __ ____]],
  [[| |     / /__  / /________  ____ ___  ___       / ____/ |/ //  _/]],
  [[| | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \     / /    |   / / /  ]],
  [[| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/    / /___ /   |_/ /   ]],
  [[|__/|__/\___/_/\___/\____/_/ /_/ /_/\___( )   \____//_/|_/___/   ]],
  [[                                        |/                       ]],
}
startify.section.top_buttons.val    = {
  startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  startify.button("r", "Resume Session", ":SessionManager load_session<CR>"),
}
-- disable MRU
startify.section.mru.val            = { { type = "padding", val = 0 } }
-- disable MRU cwd
startify.section.mru_cwd.val        = { { type = "padding", val = 0 } }
startify.section.bottom_buttons.val = {
  startify.button("q", "  Quit NVIM", ":qa<CR>"),
}
-- disable nvim_web_devicons
startify.nvim_web_devicons.enabled  = true
startify.nvim_web_devicons.highlight = true
startify.nvim_web_devicons.highlight = 'Keyword'
--
startify.section.footer             = {
  { type = "text", val = "footer" },
}

startify.mru_opts.ignore = function(path, ext)
  return (string.find(path, "COMMIT_EDITMSG"))
      or (vim.tbl_contains(default_mru_ignore, ext))
end
alpha.setup(startify.config)
