return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
        require('tiny-inline-diagnostic').setup({
			preset = "amongus",
			options = {
				throttle = 0,
				enable_on_insert = true,
				multilines = {
					-- Enable multiline diagnostic messages
					enabled = true,
				}
			}
		})
        vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end
}
