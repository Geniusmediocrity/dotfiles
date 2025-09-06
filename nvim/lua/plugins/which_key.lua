return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	opts = {
		-- delay between pressing a key and opening which-key (milliseconds)
		-- this setting is independent of vim.o.timeoutlen
		delay = 0,

		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = " ",
		},

		-- Document existing key chains
		spec = {
			{ "<leader>s", group = " [S]earch" },
			{ "<leader>sh", group = " [H]istory" },
			{ "<leader>sg", group = " [G]it" },
			{ "<leader>c", group = " [C]olor" },
			{ "<leader>g", group = "󰊢 [G]it" },
			{ "<leader>t", group = "󱐚 [T]rouble" },
			{ "<leader>L", group = "󰒋 [L]ive Server" },
			{ "<leader>l", group = "󰰌 [L]SP" },
			{ "<leader>w", group = " [W]indow" },
			{ "<leader>M", group = " [M]arkdown" },
			{ "<leader>n", group = "󰰒 [N]oice" },
			{ "<leader>N", group = " [N]avigate" },
			{ "<leader>d", group = "󰃤 [D]ebug" },
		},
	},
}
