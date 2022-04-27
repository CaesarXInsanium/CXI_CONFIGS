local alpha                   = require('alpha')
local dashboard               = require 'alpha.themes.dashboard'

dashboard.section.header.val  = {
[[ _       __     __                               _______  __ ____]],
[[| |     / /__  / /________  ____ ___  ___       / ____/ |/ //  _/]],
[[| | /| / / _ \/ / ___/ __ \/ __ `__ \/ _ \     / /    |   / / /  ]],
[[| |/ |/ /  __/ / /__/ /_/ / / / / / /  __/    / /___ /   |_/ /   ]],
[[|__/|__/\___/_/\___/\____/_/ /_/ /_/\___( )   \____//_/|_/___/   ]],
[[                                        |/                       ]],
}
dashboard.section.buttons.val = {
        dashboard.button("e", "Empty Buffer",":ene <BAR> startinsert <CR>" ),
        dashboard.button("r", "Resume Session",":SessionManager load_session<CR>" ),
        dashboard.button("q", "Quit",":qa!<CR>" ),
}
local handle                  = io.popen('fortune')
local fortune                 = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune
dashboard.config.opts.noautocmd = true

vim.cmd [[autocmd User AlphaReady echo 'ready']]

alpha.setup(dashboard.config)
