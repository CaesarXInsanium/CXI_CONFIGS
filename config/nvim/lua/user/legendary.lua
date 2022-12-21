vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymaps = {

  { "<S-l>", "<cmd>bnext<CR>", description = "tab forward in buffers" },
  { "<S-h>", "<cmd>bprevious<CR>", description = "tab backward in buffers" },
  { "<C-w><CR>", "<cmd>FocusSplitNicely<CR>", description = "Add new Split" },
  { "<C-w>j", "<cmd>FocusSplitDown<CR>", description = "Split Down" },
  { "<C-w>k", "<cmd>FocusSplitUp<CR>", description = "Split Up" },
  { "<C-w>h", "<cmd>FocusSplitLeft<CR>", description = "Split Left" },
  { "<C-w>l", "<cmd>FocusSplitRight<CR>", description = "Split Right" },
  { "<C-w>m", "<cmd>FocusMaxOrEqual<CR>", description = "Maximize Window" },

  { "<leader>qc", "<cmd>Telescope colorscheme<Enter>", description = "change colorscheme" },
  { "<leader>qr", "<cmd>source ~/.config/nvim/init.lua<Enter>", description = "reload neovim" },
  { "<leader>qQ", "<cmd>wqa<Enter>", description = "" },
  { "<leader>qo", "<cmd>Telescope vim_options<Enter>", description = "" },

  { "<leader>aa", "<cmd>lua require('material.functions').toggle_style()<CR>",
    description = "toggle material colorscheme" },

  { "<leader>t", "<cmd>!alacritty -e zsh &<Enter>", description = "launch alacritty terminal" },
  { "<leader>tb", "<cmd>!alacritty -e bash &<Enter>", description = "with bash" },
  { "<leader>tf", "<cmd>!alacritty -e fish &<Enter>", description = "with fish" },
  { "<leader>tz", "<cmd>!alacritty -e zsh &<Enter>", description = "with zsh" },
  { "<leader>tn", "<cmd>!alacritty -e nushell &<Enter>", description = "with nushell" },

  { "<leader>n", "<cmd>Neogit<Enter>", description = "Git UI" },
  { "<leader>p", "<cmd>!python3 % <CR>", description = "python 3" },
  { "<leader>mr", "<cmd>make run<Enter>", description = "make run target" },
  { "<leader>ma", "<cmd>make all<Enter>", description = "make all" },
  { "<leader>mt", "<cmd>make test<Enter>", description = "make test target" },
  { "<leader>mc", "<cmd>make clean<Enter>", description = "make clean target" },
  { "<leader>md", "<cmd>make debug<Enter>", description = "make debug target" },

  { "<leader>b", "<cmd>Telescope buffers<cr>", description = "switch between open buffers" },
  { "<leader>f", "<cmd>Telescope fd<cr>", description = "find files in folder" },
  { "<leader>g", "<cmd>Telescope live_grep<cr>", description = "find regex in folder" },
  { "<leader>m", "<cmd>Telescope man_pages<cr>", description = "man pages" },

  { "<C-Space>", "<cmd>NvimTreeToggle .<CR>", description = "NvimTree Toggle" },

  { "<leader>F", "<cmd>LspZeroFormat<CR>", description = "format code using LSP" },
  { "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", description = "format code using LSP" },
  { "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", description = "code action" },
  { "<leader>R", "<cmd>lua vim.lsp.buf.rename()<CR>", description = "rename symbol using LSP" },
  { "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", description = "documentation hover" },
  { "<leader>K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", description = "signaure help" },
  { "<leader>r", "<cmd>Telescope lsp_references<CR>", description = "list LSP referances" },
  { "<leader>i", "<cmd>Telescope lsp_implementations<CR>", description = "find where symbol is used" },

  { "<leader>li", "<cmd>LspInfo<CR>", description = "info on lsp servers" },
  { "<leader>lu", "<cmd>Mason<CR>", description = "Mason UI" },
  { "<leader>lr", "<cmd>LspRestart<CR>", description = "restart lsp servers" },

  -- Dashboard Keys
  { "<leader>ss", "<cmd>SessionManager save_current_session<CR>", description = "Save Session" },
  { "<leader>sl", "<cmd>SessionManager load_session<CR>", description = "open saved session" },
  { "<leader>sr", "<cmd>SessionManager load_last_session<CR>", description = "open last used session" },

  -- Legendary
  { "<leader>qk", "<cmd>Legendary<CR>", description = "Browser keymaps" },

  -- Conjure REPL
  { "<leader>Es", "<cmd>ConjureConnect guile.socket<CR>", description = "" },
  { "<leader>ee", "<cmd>ConjureEval<CR>", description = "" },
  { "<leader>ee", "<cmd>ConjureEval<CR>", description = "" },
  { "<leader>ev", "<cmd>ConjureEvalVisual<CR>", description = "" },
  { "<leader>eb", "<cmd>ConjureEvalBuf<CR>", description = "" },
  { "<leader>es", "<cmd>ConjureClientState<CR>", description = "" },
  { "<leader>els", "<cmd>ConjureLogVSplit<CR>", description = "" },
}

local config = {
  keymaps = keymaps,
  which_key = {
    auto_register = true,
  }
}

REQUIRE('legendary', config)
