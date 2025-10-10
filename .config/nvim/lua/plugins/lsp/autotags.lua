return {
	"windwp/nvim-ts-autotag",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-ts-autotag").setup({
			enable = true,
			filetypes = {
				"html",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"svelte",
				"vue",
				"tsx",
				"jsx",
				"rescript",
				"xml",
				"php",
				"markdown",
				"astro",
				"glimmer",
				"handlebars",
		},
			skip_tags = {
				"area", "base", "br", "col", "command", "embed", "hr", "img", "input",
				"keygen", "link", "meta", "param", "source", "track", "wbr", "menuitem",
		}
		})
  end,
}

