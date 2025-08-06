return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function(_, opts)
		require("todo-comments").setup(opts)
	end,
	keys = {
		{ "<leader>tt", "<cmd>TodoTrouble<cr>", desc = "TODOs (Trouble)" },
		{ "<leader>st", "<cmd>TodoTelescope<cr>", desc = "TODOs (Telescope)" },
	},
}
