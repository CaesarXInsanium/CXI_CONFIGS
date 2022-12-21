local status, iron = pcall(require, "iron.core")
if not status then
  print("Iron could not be loaded")
  return
end

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = { "zsh" }
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').bottom(40),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>ec",
    visual_send = "<space>ec",
    send_file = "<space>ef",
    send_line = "<space>el",
    send_mark = "<space>zm",
    mark_motion = "<space>Ec",
    mark_visual = "<space>Ec",
    remove_mark = "<space>Ed",
    cr = "<space>e<cr>",
    interrupt = "<space>e<space>",
    exit = "<space>eq",
    clear = "<space>el",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}
