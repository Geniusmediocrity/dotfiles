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

	-- === Tabs ===
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

	-- === Panes ===
	{
		brief = "Spawn New Horizontal Pain",
		key = "g",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{
		brief = "Spawn New Vertical Pain",
		key = "v",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ ActivatePaneDirection = "Left" }),
	},

	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ ActivatePaneDirection = "Right" }),
	},

	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ ActivatePaneDirection = "Up" }),
	},

	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ ActivatePaneDirection = "Down" }),
	},

	{
		key = "C",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},

	-- === Misc ===
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
