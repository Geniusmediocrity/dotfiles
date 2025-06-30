local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.mouse_bindings = {
	{
		brief = "Select Word on Double Click",
		event = { Down = { streak = 2, button = "Left" } },
		mods = "NONE",
		action = act.SelectTextAtMouseCursor("Word"),
	},

	{
		brief = "Select Line on Triple Click",
		event = { Down = { streak = 3, button = "Left" } },
		mods = "NONE",
		action = act.SelectTextAtMouseCursor("Line"),
	},

	{
		brief = "Copy to clipboard on mouse release (Linux-style)",
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},

	{
		brief = "Open Links with CTRL + Click",
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
}

return config.mouse_bindings
