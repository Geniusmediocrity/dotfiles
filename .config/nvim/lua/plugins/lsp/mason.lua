return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		lazy = false,
		opts = {
			ensure_installed = {
				"pyright",
				"ruff",
				"debugpy",
				"typescript-language-server",
				"html-languageserver",
				"css-languageserver",
				"rust-analyzer",
				"stylua",
				"prettierd",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup()
		end,
	}
}
