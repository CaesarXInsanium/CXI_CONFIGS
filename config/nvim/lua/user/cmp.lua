local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

-- Nerd Fonts
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  -- help :cmp-mapping
  mapping = cmp.mapping.preset.insert({
    ['<M-k>'] = cmp.mapping.scroll_docs(-4),
    ['<M-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Nvim_Lua]",
        luasnip = "[LuaSnippet]",
        buffer = "[Buffer]",
        path = "[Path]",
        --       fuzzy_path = "[FzPath]",
        rg = "[RG]",
        latex_symbols = "[Latex]",
        crates = "[Crates]",
        fish = "[Fish]"
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    --    { name = 'luasnip' },
    { name = 'crates' },
    --    { name = 'buffer' },
    { name = 'fish' },
    { name = 'rg' },
    --    { name = 'latex_symbols'}
  }),
}

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
