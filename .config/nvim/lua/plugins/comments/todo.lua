return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function(_, opts)
		require("todo-comments").setup(opts)
	end,
	keys = {
		{ "<leader>tt", "<cmd>TodoTrouble<cr>",   desc = "TODOs (Trouble)" },
		{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "TODOs (Telescope)" },
	},
}
