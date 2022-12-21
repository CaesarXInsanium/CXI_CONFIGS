local config = {
  org_agenda_files = { '~/Projects/Org/*', '~/OpenSource/Org/*' },
  org_default_notes_file = '~/Projects/Org/notes.org',
}

local org = REQUIRE('orgmode', config)

org.setup_ts_grammar()

