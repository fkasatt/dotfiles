require('gitsigns').setup {
  signcolumn = false,
  numhl      = true,
  linehl     = false,
  word_diff  = false,
  watch_gitdir = {
  	follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_opts = {
  	virt_text = true,
  	virt_text_pos = 'eol',
  	delay = 1000,
  	ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author> (<author_time:%Y-%m-%d>): <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil,
  max_file_length = 10000,
}
