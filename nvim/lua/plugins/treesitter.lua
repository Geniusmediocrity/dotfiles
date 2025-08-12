return
{ -- Highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	dependencies = { "tadmccorkle/markdown.nvim" },
	build = ':TSUpdate',
	main = 'nvim-treesitter.configs', -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	opts = {
		ensure_installed = {
			'python', 'bash', 'c', 'diff',
			'html', 'css', 'javascript',
			'tsx', 'vue', 'svelte',
			'lua', 'luadoc', 'markdown',
			'markdown_inline', 'query',
			'vim', 'vimdoc',
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
		autotag = {
			enable = true,
		},
		textobjects = {
			enable = true,
		},
	}
}
