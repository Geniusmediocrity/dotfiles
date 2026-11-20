return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy", -- Or `LspAttach`
	priority = 1000, -- needs to be loaded in first
	config = function()
		require("tiny-inline-diagnostic").setup({
			-- Choose a preset style for diagnostic appearance
			-- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
			preset = "modern",
			options = {
				throttle = 0,
				enable_on_insert = true,
				multilines = {
					-- Enable multiline diagnostic messages
					enabled = true,
				},
				add_messages = {
					display_count = true,
				},
			},
		})
		vim.diagnostic.config({
			virtual_text = false,
			underline = true,
		}) -- Only if needed in your configuration, if you already have native LSP diagnostics
	end,
}
