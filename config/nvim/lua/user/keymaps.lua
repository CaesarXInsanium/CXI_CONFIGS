local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Better window navigation
keymap("n", "<leader>/", ":Cheatsheet<CR>", opts)
-- Shift Bindings for navigating Buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>w", ":bdelete<Enter>", opts)
keymap("n", "<leader>W", ":%bdelete|edit#|bdelete#<Enter>", opts)

-- Resize with arrows
keymap("n", "<C-k>", ":resize +2<CR>", opts)
keymap("n", "<C-j>", ":resize -2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)


-- Terminal --
keymap("n", "<Space>t", ":split term://fish<Enter>i",opts)
keymap("n", "<Space>T", ":!alacritty &<Enter>",opts)

-- Nix
keymap("n", "<Space>nT", ":!alacritty -e bash &<Enter>",opts)
keymap("n", "<Space>nt", ":split term://bash<Enter>i",opts)


-- Nvim Keys
keymap("n", "<leader>qc", ":Telescope colorscheme<Enter>", opts)
keymap("n", "<leader>qs", ":alpha<Enter>", opts)

-- Dashboard Keys
keymap("n", "<Space>ss", ":SessionManager save_current_session<CR>", opts)
keymap("n", "<Space>sl", ":SessionManager load_session<CR>", opts)
keymap("n", "<Space>sr", ":SessionManager load_last_session<CR>", opts)

-- Code Running?
-- vim.cmd"autocmd BufEnter *.py noremap <leader>p :!python3 %<CR>"
-- vim.cmd"autocmd BufEnter *.c noremap <leader>p :!gcc -Wall % -o result && ./result<CR>"
-- vim.cmd"autocmd BufEnter *.lua noremap <leader>p :!lua5.3 %<CR>"
-- vim.cmd"autocmd BufEnter *.cpp noremap <leader>p :!g++ -Wall % -o result && ./result<CR>"
-- vim.cmd"autocmd BufEnter *.jl noremap <leader>p :!julia %<CR>"
-- vim.cmd"autocmd BufEnter *.nim noremap <leader>p :!nim run %<CR>"
-- vim.cmd"autocmd BufEnter *.rs noremap <leader>p :!rustc % -o result && ./result<CR>"

-- Rust Bindings
keymap("n", "<leader>rr", ":!cargo run<Enter>", opts)
keymap("n", "<leader>rc", ":!cargo check<Enter>", opts)
keymap("n", "<leader>rb", ":!cargo build --release<Enter>", opts)
keymap("n", "<leader>rt", ":!cargo test<Enter>", opts)
keymap("n", "<leader>rf", ":!cargo fmt --all<Enter>", opts)

-- Make Bindings
keymap("n", "<leader>mr", ":!make run<Enter>", opts)
keymap("n", "<leader>ma", ":!make all<Enter>", opts)
keymap("n", "<leader>mt", ":!make test<Enter>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope buffers<cr>", opts)

-- NvimTree
keymap("n", "<C-space>", "<cmd>NvimTreeToggle<CR>", opts)

