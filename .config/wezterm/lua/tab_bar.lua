local wezterm = require("wezterm")

local BG = "#1e1e2e"
local ACTIVE_BG = "#c6a0f6"
local ACTIVE_FG = "#1e1e2e"
local HOVER_BG = "#89b4fa"
local HOVER_FG = "#313244"
local INACTIVE_BG = "#313244"
local INACTIVE_FG = "#cdd6f4"

-- The filled in variant of the < symbol
local LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick -- wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick -- wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function Tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

local function cnfg_tab_bar(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#0b0022"
	local background = BG
	local foreground = "#808080"

	if tab.is_active then
		background = ACTIVE_BG
		foreground = ACTIVE_FG
	elseif hover then
		background = HOVER_BG
		foreground = HOVER_FG
	else
		background = INACTIVE_BG
		foreground = INACTIVE_FG
	end

	local edge_foreground = background

	local title = Tab_title(tab)
	if #title > 10 then
		title = title:match("^.*/(.+)$")
	end

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = RIGHT_ARROW .. " " },
	}
end

return cnfg_tab_bar
