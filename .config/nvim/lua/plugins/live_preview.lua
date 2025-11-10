return {
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opt = {
			port = 5500,
			browser = "default",

			-- If true, the root directory of the server will be the parent
			-- directory of the current file. Otherwise, it will be |current-directory|.
			dynamic_root = false,

			sync_scroll = true,
			picker = "telescope",
		},
	},
}
