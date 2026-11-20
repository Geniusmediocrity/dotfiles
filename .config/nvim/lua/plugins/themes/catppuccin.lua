return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	opts = {
		flavour = "mocha",
		transparent_background = false,
		show_end_of_buffer = false,
		term_colors = true,
		integrations = {
			cmp = true,
			blink_cmp = true,
			gitsigns = true,
			neotree = true,
			nvimtree = true,
			fzf = true,
			treesitter = true,
			bufferline = true,
			which_key = true,
		},
		styles = {
			comments = { "italic" },
		},
		custom_highlights = function(colors)
			return {
				DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
				DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
				DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
				DiagnosticUnderlineHint = { undercurl = true, sp = colors.teal },
			}
		end,
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
