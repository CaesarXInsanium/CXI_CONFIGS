local status, null = pcall(require, "null-ls")

if not status then
  print("Null-ls could not be loaded")
  return
end

null.setup({
  sources = {
    -- paru -S markdownlint
    null.builtins.formatting.markdownlint,
    null.builtins.diagnostics.markdownlint,
    -- requires curl
    null.builtins.hover.dictionary,
    null.builtins.completion.spell,
    null.builtins.completion.tags,

    -- pip install proselint
    null.builtins.code_actions.proselint,
    null.builtins.diagnostics.proselint,
    -- paru -S shellcheck
    null.builtins.code_actions.shellcheck,

    null.builtins.formatting.fnlfmt.with({
      filetypes = { "fennel", "fnl", "lsp", "lisp", "scm", "scheme", "el" }
    })

  },
})

local parantheses_check = {
  method = null.methods.DIAGNOSTICS,
  filetypes = { "scheme", "commonlisp", "elisp", "scm" },
  generator = {
    fn = function(params)
      local diagnostics = {}
      local stack = {}
      for i, line in ipairs(params.content) do
        for j = 1, string.len(line) do
          -- char in ipairs(string:gmatch(line))
          local char = string.sub(line, j, j)
          if char == "(" then
            table.insert(stack, {
              row = i,
              col = j,
            })
          elseif char == ")" then
            table.remove(stack)
          end
        end
      end

      for i, item in pairs(stack) do
        table.insert(diagnostics, {
          row = item.row,
          col = item.col,
          end_col = item.col + 1,
          source = "parantheses_check",
          message = "Missing Paranthesis",
          severity = vim.diagnostic.severity.WARN
        })
      end
      return diagnostics
    end
  }
}

null.register(parantheses_check)
