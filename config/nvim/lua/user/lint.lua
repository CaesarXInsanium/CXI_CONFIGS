local status, lint = pcall(require, 'lint')
if not status then
  print("Lint could not be called")
end

lint.linters_by_ft = {
  markdown = { 'markdownlint', }
}

vim.api.nvim_create_autocmd({ "BufWritePost" ,"InsertLeave", "TextChanged" }, {
  callback = function()
    lint.try_lint()
  end,
})
