return { -- Fuzzy Finder (files, lsp, etc)
	'nvim-telescope/telescope.nvim',
	event = 'VimEnter',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			'nvim-telescope/telescope-fzf-native.nvim',

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = 'make',

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
		{ 'nvim-telescope/telescope-ui-select.nvim' },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	},

	config = function()
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?

		local actions = require('telescope.actions')
		require('telescope').setup {
			extensions = {
				['ui-select'] = {
					require('telescope.themes').get_dropdown(),
				},
			},

			defaults = {
				mappings = {
					i = {  -- Insert mode
						["<C-j>"] = actions.move_selection_next,     -- Move Selection Next
						["<C-k>"] = actions.move_selection_previous, -- Move Selection Previous
						["<C-u>"] = actions.preview_scrolling_up,    -- Scroll Preview Up
						["<C-d>"] = actions.preview_scrolling_down,  -- Scroll Preview Down
					},
					n = {  -- Normal mode
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
					},
				},
			},
		}

		-- Enable Telescope extensions if they are installed
		pcall(require('telescope').load_extension, 'fzf')
		pcall(require('telescope').load_extension, 'ui-select')

	end,
}
