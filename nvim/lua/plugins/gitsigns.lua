return {
	'lewis6991/gitsigns.nvim',
	event = 'BufReadPre',
	opts = {
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '-' },
			untracked = { text = '⋮' },
		},
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = 'eol',
			delay = 1000,
		},
    },
}
