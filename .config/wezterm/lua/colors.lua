local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Цвета Catppuccin Macchiato
config.colors = {
	foreground = "#CAD3F5",
	background = "#24273A",

	selection_fg = "#24273A",
	selection_bg = "#F4DBD6",

	cursor_fg = "#24273A",
	cursor_bg = "#F4DBD6",
	cursor_border = "#F4DBD6",

	-- Табы
	tab_bar = {
		background = "#181926",
		active_tab = {
			bg_color = "#C6A0F6",
			fg_color = "#181926",
		},
		inactive_tab = {
			bg_color = "#1E2030",
			fg_color = "#CAD3F5",
		},
	},

	-- ANSI палитра (color0–color15)
	ansi = {
		"#494D64", -- color0
		"#ED8796", -- color1
		"#A6DA95", -- color2
		"#EED49F", -- color3
		"#8AADF4", -- color4
		"#F5BDE6", -- color5
		"#8BD5CA", -- color6
		"#B8C0E0", -- color7
	},
	brights = {
		"#5B6078", -- color8
		"#ED8796", -- color9
		"#A6DA95", -- color10
		"#EED49F", -- color11
		"#8AADF4", -- color12
		"#F5BDE6", -- color13
		"#8BD5CA", -- color14
		"#A5ADCB", -- color15
	},
}

return config.colors
