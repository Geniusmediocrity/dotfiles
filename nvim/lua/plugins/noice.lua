return {
	-- lazy.nvim
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
		"nvim-lua/plenary.nvim",
	},
	opts = {
		views = {
			cmdline_popup = {
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				position = {
					row = "97%",
					col = "50%",
					anchor = "SW",
				},
				size = {
					width = "40%", -- Ширина окна
					height = "auto",
				},
				animation = "slide_up",
			},
		},
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
		},
	},
}
