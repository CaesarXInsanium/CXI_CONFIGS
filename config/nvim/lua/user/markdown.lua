local status, mdeval = pcall(require, 'mdeval')

if not status then
  print("mdeval could not be loaded")
end

mdeval.setup({
  allow_file_types = {'python', 'cpp','scheme'},
  -- Don't ask before executing code blocks
  require_confirmation = false,
  -- Change code blocks evaluation options.
  eval_options = {
    -- Set custom configuration for C++
    cpp = {
      command = { "clang++", "-std=c++20", "-O0" },
      default_header = [[
    #include <iostream>
    #include <vector>
    using namespace std;
      ]]
    },
    -- Add new configuration for Racket
    racket = {
      command = { "racket" }, -- Command to run interpreter
      language_code = "racket", -- Markdown language code
      exec_type = "interpreted", -- compiled or interpreted
      extension = "rkt", -- File extension for temporary files
    },
    scheme = {
      command = { "guile" },
      language_code = "scheme",
      exec_type = "interpreted",
      extension = "scm"
    }
  },
})
