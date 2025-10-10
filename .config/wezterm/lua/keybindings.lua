local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.keys = {

	{
		brief = "Copy Selected Text",
		key = "c",
		mods = "CTRL",
		action = act.CopyTo("Clipboard"),
	},

	{
		brief = "Paste Copied Text",
		key = "v",
		mods = "CTRL",
		action = act.PasteFrom("Clipboard"),
	},

	-- disable standart combines Ctrl+Shift+C/V
	{ key = "c", mods = "CTRL|SHIFT", action = act.Nop },
	{ key = "v", mods = "CTRL|SHIFT", action = act.Nop },
	{ key = "l", mods = "CTRL|SHIFT", action = act.Nop },

	{
		brief = "Spawn New Tab",
		key = "n",
		mods = "CTRL|SHIFT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},

	{
		brief = "Switch to Last Tab",
		key = "9",
		mods = "ALT|SHIFT",
		action = act.ActivateLastTab,
	},

	{
		brief = "Switch to Previous Tab",
		key = "[",
		mods = "ALT",
		action = act.ActivateTabRelative(-1),
	},

	{
		brief = "Switch to Next Tab",
		key = "]",
		mods = "ALT",
		action = act.ActivateTabRelative(1),
	},

	{
		brief = "Map CapsLock to Left Control",
		key = "CapsLock",
		action = act.SendKey({ key = "LeftControl" }),
	},

	{
		brief = "Delete word forward (CTRL + Delete)",
		key = "Delete",
		mods = "CTRL",
		action = act({ SendString = "\x1b[3;5~" }),
	},

	{
		brief = " Delete word backward (Ctrl+Backspace)",
		key = "Backspace",
		mods = "CTRL",
		action = act({ SendString = "\x17" }),
	},

	{
		brief = "Kill Current Process",
		key = "q",
		mods = "CTRL|SHIFT",
		action = act({ SendString = "\x03" }),
	},
}

-- Switching between tabs on Ctrl + Alt + <number-of-tab>
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|SHIFT",
		action = act.ActivateTab(i - 1),
	})
end

return config.keys
