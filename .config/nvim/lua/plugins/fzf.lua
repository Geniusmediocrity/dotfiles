return {
	"ibhagwan/fzf-lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			-- Windows pop-up settings
			winopts = {
				height = 0.85,
				width = 0.85,
				row = 0.35,
				col = 0.50,
				preview = {
					layout = "vertical",
					vertical = "down:45%",
				},
			},

			-- Keymaps
			keymap = {
				-- Settings for lua-interface
				builtin = {
					["<C-j>"] = "down",
					["<C-k>"] = "up",
					["<C-u>"] = "preview-page-up",
					["<C-d>"] = "preview-page-down",
				},
				-- Settings for fzf binary file
				fzf = {
					["ctrl-j"] = "down",
					["ctrl-k"] = "up",
					["ctrl-u"] = "preview-page-up",
					["ctrl-d"] = "preview-page-down",
				},
			},
		})

		-- Registrating as a vim.ui.select
		fzf.register_ui_select()
	end,
}
