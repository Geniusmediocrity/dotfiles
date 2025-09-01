return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		modes = {
			search = {
				enabled = true,
			},
			char = {
				jump_lables = true,
			},
		},
	},
	-- stylua: ignore
	keys = {
		{ "q",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash [Q]uery" },
		{ "Q",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter [Q]uery" },
		{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "[R]emote Flash" },
		{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter [R]emote Search" },
		{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash [S]earch" },
	},
}
