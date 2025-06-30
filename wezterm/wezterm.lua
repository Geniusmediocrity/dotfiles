local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- === Terminal and Shell (only for windows) ===
config.default_prog = { "wsl.exe", "-d", "ubuntu" }
config.default_workspace = "home"

-- === Virtual environments ===
config.set_environment_variables = {
	TERM = "xterm-256color",
}

-- === Initial Settings ===
config.initial_rows = 35
config.initial_cols = 120

-- === Font Settings ===
config.font_size = 12
config.font = wezterm.font("MesloLGS NF")

-- === Colors ===
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Custom Scheme"
-- config.colors = require("lua.custom.colors")

-- === Appearance ===
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 1,
	right = 1,
	top = 1,
	bottom = 1,
}
config.window_background_opacity = 0.95

-- === Keybindings ===
config.keys = require("lua.custom.keybindings")
config.mouse_bindings = require("lua.custom.mousebindings")

-- === Miscellaneous settings ===
config.max_fps = 120
config.prefer_egl = true

return config
