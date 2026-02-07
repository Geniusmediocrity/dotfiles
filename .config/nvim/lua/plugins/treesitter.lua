return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	opts = {
		ensure_installed = {
			"python",
			"bash",
			"c",
			"cpp",
			"diff",
			"html",
			"css",
			"javascript",
			"lua",
			"luadoc",
			"markdown",
		},
		-- Autoinstall languages that are not installed
		sync_install = true,
		auto_install = true,
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		textobjects = {
			enable = true,
		},
	},
}
