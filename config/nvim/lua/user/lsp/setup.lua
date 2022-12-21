LSP_CAPABILITIES = vim.lsp.protocol.make_client_capabilities()
LSP_CAPABILITIES = require('cmp_nvim_lsp').default_capabilities(LSP_CAPABILITIES)
LSP_KEY_ATTACH_FUN = function(client, bufnr)

  local keys = require('user.lsp.keymaps')
  local set_keymap = vim.api.nvim_set_keymap
  local set_bufmap = vim.api.nvim_buf_set_keymap
  for _, key in pairs(keys.keymap) do
    set_keymap(key[1], key[2], key[3], key[4])
  end
  for _, key in pairs(keys.bufmap) do
    set_bufmap(bufnr, key[1], key[2], key[3], key[4])
  end

  vim.diagnostic.config({
    virtual_text = false,
  })
end
local function setupAll(servers)

  for _, lsp in pairs(servers) do

    if lsp == 'clangd' then -- managed by clang-tools
      -- elseif lsp == 'rust_analyzer' then
    elseif lsp == 'nimls' then
      require('lspconfig')[lsp].setup {
        on_attach = LSP_KEY_ATTACH_FUN,
        capabilities = LSP_CAPABILITIES,
        filetypes = { 'nim' },
        cmd = { 'nimlsp' },
        flags = {
          -- This will be the default in neovim 0.7+
          debounce_text_changes = 150,
        }
      }
    else

      require('lspconfig')[lsp].setup {
        on_attach = LSP_KEY_ATTACH_FUN,
        capabilities = LSP_CAPABILITIES,
        flags = {
          -- This will be the default in neovim 0.7+
          debounce_text_changes = 150,
        }
      }
    end
  end
end

-- lsp.<server>.setup(coq.lsp_ensure_capabilities(<stuff...>))
return setupAll
