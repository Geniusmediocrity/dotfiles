return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = {
					"pyright",
					"ruff-lsp",
					"typescript-language-server",
					"html-languageserver",
					"css-languageserver",
					"rust-analyzer",
					"stylua",
					"prettierd",
					"debugpy",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup()
		end,
	}
}
