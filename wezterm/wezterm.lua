local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- === Terminal and Shell ===
config.scrollback_lines = 10000

-- === Virtual environments ===
config.set_environment_variables = {
	TERM = "xterm-256color",
}

-- === Initial Settings ===
config.initial_rows = 35
config.initial_cols = 120

-- === Font Settings ===
config.font_size = 12
config.font = wezterm.font("Dank Mono")

-- === Colors ===
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Custom Scheme" -- If no Catppuccin theme
-- config.colors = require("lua.colors")

-- === Appearance ===
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.94
config.status_update_interval = 1000
wezterm.on("format-tab-title", require("lua.tab_bar"))
wezterm.on("update-right-status", require("lua.top_bar"))

-- === Dim inactive panes ===
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

-- === Keybindings ===
config.keys = require("lua.keybindings")
config.mouse_bindings = require("lua.mousebindings")

-- === Miscellaneous settings ===
config.max_fps = 120
config.prefer_egl = true

return config
