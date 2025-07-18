local wezterm = require("wezterm")

local cnfg_top_bar = function(window, pane)
	local basename = function(s)
		-- Nothing a little regex can't fix
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- === Current working directory ===
	local cwd = pane:get_current_working_dir()
	cwd = cwd and basename(cwd.file_path) or ""

	-- === Current command ===
	local cmd = pane:get_foreground_process_name()
	cmd = cmd and basename(cmd) or ""

	local cmd_font = ""
	if cmd == "nvim" then
		cmd_font = wezterm.nerdfonts.linux_neovim
	elseif cmd == "vim" then
		cmd_font = wezterm.nerdfonts.custom_vim
	elseif cmd == "tmux" then
		cmd_font = wezterm.nerdfonts.cod_terminal_tmux
	elseif cmd == "python" or cmd == "pip" or cmd == "uv" then
		cmd_font = wezterm.nerdfonts.dev_python
	elseif string.lower(cmd):find("redis") then
		cmd_font = wezterm.nerdfonts.dev_redis
	elseif string.lower(cmd):find("postgres") or string.lower(cmd):find("psql") then
		cmd_font = wezterm.nerdfonts.dev_postgresql
	elseif string.lower(cmd):find("docker") then
		cmd_font = wezterm.nerdfonts.dev_docker
	elseif cmd == "ansible" then
		cmd_font = wezterm.nerdfonts.dev_ansible
	elseif cmd == "terraform" then
		cmd_font = wezterm.nerdfonts.dev_terraform
	elseif cmd == "lua" then
		cmd_font = wezterm.nerdfonts.dev_lua
	elseif string.lower(cmd):find("radian") or string.lower(cmd):find("r") then
		cmd_font = wezterm.nerdfonts.md_language_r
	else
		cmd_font = wezterm.nerdfonts.fa_code
	end

	-- === Battery ===
	local bat = 0
	for _, b in ipairs(wezterm.battery_info()) do
		bat = math.ceil(b.state_of_charge * 100)
	end

	-- Choose the color and icon for the battery
	local bat_font = ""
	local bat_color = ""
	if bat > 79 then
		bat_color = "#01FF51"
		bat_font = wezterm.nerdfonts.fa_battery_full
	elseif bat > 49 and bat <= 80 then
		bat_color = "#35F070"
		bat_font = wezterm.nerdfonts.fa_battery_three_quarters
	elseif bat >= 29 and bat <= 50 then
		bat_color = "#FFDC6B"
		bat_font = wezterm.nerdfonts.fa_battery_half
	elseif bat >= 20 and bat < 30 then
		bat_color = "#DE641C"
		bat_font = wezterm.nerdfonts.fa_battery_quarter
	else
		bat_color = "#EB4C0C"
		bat_font = wezterm.nerdfonts.fa_battery_empty
	end

	-- Right status
	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Bold" } },
		{ Foreground = { Color = "#FFB86C" } },
		{ Text = wezterm.nerdfonts.custom_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "#C6B8FF" } },
		{ Text = cmd_font .. "  " .. cmd },
		{ Text = " | " },
		{ Foreground = { Color = bat_color } },
		{ Text = bat_font .. "  " .. bat .. "%" },
		{ Text = " |" },
	}))
end

return cnfg_top_bar
