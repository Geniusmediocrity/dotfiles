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
		cmdline = {
			enabled = true,
		},
	},
	vim.keymap.set('n', '<leader>nh', ':Noice dismiss<CR>', { silent = true, desc = "[N]oice [H]ide All Messages" })
}

