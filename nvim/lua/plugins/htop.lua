return {
    "idossha/htop.nvim",
    config = function()
		-- Default configuration
		require("htop").setup({
			-- window size (percentage of screen)
			width = 0.85,
			height = 0.85,
        
			-- window appearance
			border = "rounded",
			title = " htop ",
			title_pos = "center",
        
			-- command to run (can be changed to btop, etc.)
			command = "htop",
        
			-- keymaps
			keymaps = {
				close = "q",
				help = "?",
			},
		})
      
		-- Add a keymap to open htop
		vim.keymap.set("n", "<leader>HT", require("htop").open, { desc = "Open floating htop" })
    end,
}

