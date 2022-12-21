-- this shit does not work for the life of me
local nav = require('navigator')
local installer = require('nvim-lsp-installer')

nav.setup({
  debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
  width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.3, -- max list window height, 0.3 by default
  preview_height = 0.35, -- max height of preview windows
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
  -- 'shadow', or a list of chars which defines the border
  -- put a on_attach of your own here, e.g
  -- function(client, bufnr)
  --   -- the on_attach will be called at end of navigator on_attach
  -- end,
  -- The attach code will apply to all LSP clients

  default_mapping = true, -- set to false if you will remap every key or if you using old version of nvim-
  keymaps = {
    { key = "gD", func = vim.lsp.declaration, doc = 'Go Declaration' },
    { key = "gd", func = vim.lsp.buf.definition, doc = 'Go to definition' },
    { key = "gi", func = vim.lsp.buf.implementation, doc = 'List implementations' },
    { key = "K", func = vim.lsp.declaration, doc = 'Hover Definition' },
    { key = "[d", func = vim.diagnostic.goto_prev, doc = 'Go to next diagnostic' },
    { key = "]d", func = vim.diagnostic.goto_next, doc = 'Go to prev diagnostic' },
    { key = "<leader>cd", func = vim.diagnostic.setloclist, doc = 'Set lock list' },
    { key = "<leader>cF", func = vim.diagnostic.open_float, doc = 'Open Diagnostic Float' },
    { key = "<leader>cf", func = vim.lsp.buf.formatting, doc = 'Format Code' },
    { key = "<leader>ck", func = vim.lsp.buf.signature_help, doc = 'Signature Help' },
    { key = "<leader>ct", func = vim.lsp.buf.type_definition, doc = 'Type Definition' },
    { key = "<leader>cR", func = vim.lsp.buf.type_definition, doc = 'Rename Item' },
    { key = "<leader>ca", func = vim.lsp.buf.code_action, doc = 'Code Action' },
    { key = "<leader>cwa", func = vim.lsp.buf.add_workspace_folder, doc = 'Add Workspace Folder' },
    { key = "<leader>cwr", func = vim.lsp.buf.remove_workspace_folder, doc = 'Add Workspace Folder' },
    { key = "<leader>cwl", func = vim.lsp.buf.list_workspace_folders, doc = 'Add Workspace Folder' },
  },
  -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
  -- please check mapping.lua for all keymaps
  treesitter_analysis = true, -- treesitter variable context
  treesitter_analysis_max_num = 100, -- how many items to run treesitter analysis
  -- this value prevent slow in large projects, e.g. found 100000 reference in a project
  transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

  lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
  -- setup here. if it is nil, navigator will not init signature help
  signature_help_cfg = nil, -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
  icons = {
    -- Code action
    code_action_icon = "🏏", -- note: need terminal support, for those not support unicode, might crash
    -- Diagnostics
    diagnostic_head = '🐛',
    diagnostic_head_severity_1 = "🈲",
    -- refer to lua/navigator.lua for more icons setups
  },
  lsp_installer = true, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
  lsp = {
    enable = true, -- skip lsp setup if disabled make sure add require('navigator.lspclient.mapping').setup() in you
    -- own on_attach
    code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    format_on_save = true, -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
    disable_format_cap = { "sqls", "gopls" }, -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
    disable_lsp = { 'pylsd', 'sqlls' }, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
    -- only want to enable one lsp server
    -- to disable all default config and use your own lsp setup set
    -- disable_lsp = 'all'
    -- Default {}
    diagnostic = {
      underline = true,
      virtual_text = true, -- show virtual for diagnostic message
      update_in_insert = false, -- update diagnostic message in insert mode
    },

    diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
    -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
    diagnostic_virtual_text = true, -- show virtual for diagnostic message
    diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
    disply_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you  want to
    -- tsserver = {
    --   filetypes = { 'typescript' } -- disable javascript etc,
    --   -- set to {} to disable the lspclient for all filetypes
    -- },
    ctags = {
      cmd = 'ctags',
      tagfile = 'tags',
      options = '-R --exclude=.git --exclude=node_modules --exclude=test --exclude=vendor --excmd=number'
    },
    gopls = { -- gopls setting
      on_attach = function(client, bufnr) -- on_attach for gopls
        print("i am a hook, I will disable document format")
        client.resolved_capabilities.document_formatting = false
      end,
      settings = {
        gopls = { gofumpt = false } -- disable gofumpt etc,
      }
    },
    sumneko_lua = {
      sumneko_root_path = vim.fn.expand("$HOME") .. "/github/sumneko/lua-language-server",
      sumneko_binary = vim.fn.expand("$HOME") .. "/github/sumneko/lua-language-server/bin/macOS/lua-language-server",
    },
    servers = {
      'sumneko_lua',
      'rust_analyzer',
      'clangd',
      'clojure_lsp',
      'cmake',
      'elixirls',
      'zls',
      'gopls',
      'asm_lsp',
      'fortls',
      'jsonls',
      'kotlin_language_server',
      'vls',
      'jdtls',
      'ltex',
      'pylsp',
      'tsserver',
      'rnix',
    }
    , -- by default empty, and it should load all LSP clients avalible based on filetype
  }
})
