local status, installer = pcall(require, 'mason')
if not status then
  print("LSP Installer not loading")
  return
end

local LSP_INSTALLER_SETTINGS = {
  -- Where Mason should put its bin location in your PATH. Can be one of:
  -- - "prepend" (default, Mason's bin location is put first in PATH)
  -- - "append" (Mason's bin location is put at the end of PATH)
  -- - "skip" (doesn't modify PATH)
  ---@type '"prepend"' | '"append"' | '"skip"'
  PATH = "prepend",

  pip = {
    -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
    upgrade_pip = false,
  },

  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,

  github = {
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    -- 2. The release version (e.g. "v0.3.0")
    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    download_url_template = "https://github.com/%s/releases/download/%s/%s",
  },

  -- The provider implementations to use for resolving package metadata (latest version, available versions, etc.).
  -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
  -- Builtin providers are:
  --   - mason.providers.registry-api (default) - uses the https://api.mason-registry.dev API
  --   - mason.providers.client                 - uses only client-side tooling to resolve metadata
  providers = {
    "mason.providers.registry-api",
  },

  ui = {
    -- Whether to automatically check for new versions when opening the :Mason window.
    check_outdated_packages_on_open = true,

    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "none",

    icons = {
      -- The list icon to use for installed packages.
      package_installed = "◍",
      -- The list icon to use for packages that are installing, or queued for installation.
      package_pending = "◍",
      -- The list icon to use for packages that are not installed.
      package_uninstalled = "◍",
    },

    keymaps = {
      -- Keymap to expand a package
      toggle_package_expand = "<CR>",
      -- Keymap to install the package under the current cursor position
      install_package = "i",
      -- Keymap to reinstall/update the package under the current cursor position
      update_package = "u",
      -- Keymap to check for new version for the package under the current cursor position
      check_package_version = "c",
      -- Keymap to update all installed packages
      update_all_packages = "U",
      -- Keymap to check which installed packages are outdated
      check_outdated_packages = "C",
      -- Keymap to uninstall a package
      uninstall_package = "X",
      -- Keymap to cancel a package installation
      cancel_installation = "<C-c>",
      -- Keymap to apply language filter
      apply_language_filter = "<C-f>",
    },
  }
}

installer.setup(LSP_INSTALLER_SETTINGS)
