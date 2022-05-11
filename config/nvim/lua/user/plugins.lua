local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Neccesary plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "BurntSushi/ripgrep"

  -- PLUGINS --
  use "windwp/nvim-autopairs"
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'norcalli/nvim-colorizer.lua'
  use 'sudormrfbin/cheatsheet.nvim' -- :Cheatsheet
  use 'akinsho/bufferline.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use '907th/vim-auto-save'

  -- Languages
  use 'simrat39/rust-tools.nvim'
  use 'Saecki/crates.nvim'
--  use 'dag/vim-fish'
--  use 'LnL7/vim-nix'

  -- CMP
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use 'lukas-reineke/cmp-rg'
  use 'kdheepak/cmp-latex-symbols'
  use {
    "mtoohey31/cmp-fish",
    ft = 'fish'
  }

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Telescope
  use {
  "nvim-telescope/telescope.nvim",
    requires = {{ 'nvim-lua/plenary.nvim'}}
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
  use "nvim-treesitter/playground"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer"
   -- simple to use language server installer

  -- Session
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }
  use 'Shatur/neovim-session-manager'

  -- Colorscheme
  use 'folke/tokyonight.nvim'
  use 'catppuccin/nvim'
  use 'haishanh/night-owl.vim'
  use 'Shatur/neovim-ayu'
  use 'tiagovla/tokyodark.nvim'
  use 'marko-cerovac/material.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'bluz71/vim-moonfly-colors'
  use 'navarasu/onedark.nvim'
  use 'shaunsingh/moonlight.nvim'
  use 'CaesarXInsanium/calveradark.nvim'
  use 'projekt0n/github-nvim-theme'
  use 'https://github.com/j4d3nw/gemstones.nvim'
  use 'https://github.com/ray-x/starry.nvim'
  use 'https://github.com/shaunsingh/nord.nvim'
  use 'https://github.com/rktjmp/lush.nvim'
  use 'https://github.com/heraldofsolace/nisha-vim'
  use 'https://github.com/AhmedAbdulrahman/aylin.vim'
  use 'https://github.com/lighthaus-theme/vim-lighthaus'
  use 'https://github.com/rmehri01/onenord.nvim'
  use 'https://github.com/sainnhe/everforest.git'
  use 'https://github.com/Mofiqul/dracula.nvim'
  use 'https://github.com/altercation/vim-colors-solarized'
  use 'https://github.com/embark-theme/vim'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
