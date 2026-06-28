return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function(_, opts)
		require("todo-comments").setup(opts)
	end,
	keys = {
		{ "<leader>T", "<cmd>TodoFzfLua<cr>", desc = "TODOs (fzf-lua)" },
	},
}
