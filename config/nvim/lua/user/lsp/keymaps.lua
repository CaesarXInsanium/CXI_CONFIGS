KEY_OPTS = { noremap = true, silent = true }

local lsp_keymap = {
  { 'n', '<space>cF', '<cmd>lua vim.diagnostic.open_float()<CR>', KEY_OPTS },
  { 'n', '<leader>[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', KEY_OPTS },
  { 'n', '<leader>]', '<cmd>lua vim.diagnostic.goto_next()<CR>', KEY_OPTS },
  { 'n', '<space>s', '<cmd>SymbolsOutline<CR>', KEY_OPTS },
  { 'n', '<space>d', '<cmd>TroubleToggle<CR>', KEY_OPTS },
}

local buf_keymap = {
  { 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', KEY_OPTS },
  { 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', KEY_OPTS },
  { 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', KEY_OPTS },
  { 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', KEY_OPTS },
  { 'n', '<leader>ck', '<cmd>lua vim.lsp.buf.signature_help()<CR>', KEY_OPTS },
  { 'n', '<space>cwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', KEY_OPTS },
  { 'n', '<space>cwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', KEY_OPTS },
  { 'n', '<space>cwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', KEY_OPTS },
  { 'n', '<space>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>', KEY_OPTS },
  { 'n', '<space>cR', '<cmd>lua vim.lsp.buf.rename()<CR>', KEY_OPTS },
  { 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', KEY_OPTS },
  { 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', KEY_OPTS },
  { 'n', '<space>cf', '<cmd>lua vim.lsp.buf.format{async=true}<CR>', KEY_OPTS },
}
return {
  keymap = lsp_keymap,
  bufmap = buf_keymap
}
