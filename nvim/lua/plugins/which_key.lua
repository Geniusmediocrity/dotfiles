return { -- Useful plugin to show you pending keybinds.
	'folke/which-key.nvim',
	event = 'VimEnter', -- Sets the loading event to 'VimEnter'
	opts = {
		-- delay between pressing a key and opening which-key (milliseconds)
		-- this setting is independent of vim.o.timeoutlen
		delay = 0,

		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = " ",
		},

		-- Document existing key chains
		spec = {
			{ '<leader>s', group = ' [S]earch' },
			{ '<leader>sh', group = ' [H]istory' },
			{ '<leader>sg', group = ' [G]it' },
			{ '<leader>c', group = ' [C]olor' },
			{ '<leader>g', group = '󰬲 [G]o to' },
			{ '<leader>t', group = '󱐚 [T]rouble' },
		},
		require('core.keymaps.which_key')
	},
}
