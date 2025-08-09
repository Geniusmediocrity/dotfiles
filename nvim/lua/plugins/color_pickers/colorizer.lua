return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPost", "BufNewFile" },  -- upload pnly when opening a file
	config = function()
		require("colorizer").setup({
			filetypes = { "*" },
			user_default_options = {
				RGB      = true, -- #RGB hex
				RRGGBB   = true, -- #RRGGBB hex
				names    = true, -- "blue", "red"
				RRGGBBAA = true, -- #RRGGBBAA
				rgb_fn   = true, -- rgb() and rgba()
				hsl_fn   = true, -- hsl() and hsla()
				mode     = "background", -- "foreground" | "background" | "virtualtext"
				tailwind = true, -- support for tailwind classes
			},
		})
	end,
}
