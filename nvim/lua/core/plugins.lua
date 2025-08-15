local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	-- Detect tabstop and shiftwidth automatically
	"NMAC427/guess-indent.nvim",

	-- NeoTree configuration
	require("plugins.neotree"),

	-- Automatic sessions saver/opener
	require("plugins.asessions"),

	-- Git signs helper
	require("plugins.gitsigns"),

	-- Telescope (Fuzzy Finder)
	require("plugins.telescope"),

	-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
	require("plugins.trouble"),

	-- Bufferline -- turns buffers(on the top of the screen in nvim) to tabs
	require("plugins.bufferline"),

	-- TreeSiteer
	require("plugins.treesitter"),

	-- Tree walker
	require("plugins.treewalker"),

	-- Theme
	require("plugins.themes"),

	-- Vim Tmux Navigator
	require("plugins.vim_tmux_navigator"),

	-- CMP Nvim
	require("plugins.cmp"),

	-- Lualine configuration
	require("plugins.lualine"),

	-- A collection of small QoL plugins for Neovim.
	require("plugins.snacks"),

	-- Urls opener
	require("plugins.url_open"),

	-- Color pickers and color previewers
	require("plugins.color_pickers"),

	-- Comments
	-- Highlight todo, notes, etc in comments
	require("plugins.comments"),

	-- Live preview is the same live server
	require("plugins.live_preview"),

	-- Which-key- Useful plugin to show you pending keybinds.
	require("plugins.which_key"),

	-- Noice = Nice, Noise, Notice
	require("plugins.noice"),

	-- Indential guides
	require("plugins.ibl"),

	-- Better Inline diagnostics
	require("plugins.inline_diagnostics"),

	-- Start menu
	require("plugins.alpha"),

	-- Neovim Terminal
	require("plugins.terminal"),

	-- Like cd, but cooler
	require("plugins.zoxide"),

	-- Uv in neovim -- the best plug for python coding, especially in combination with compiler
	require("plugins.uv"),

	-- Compiler for code
	require("plugins.compiler"),

	-- LSP and other good stuff for vibe coding
	require("plugins.lsp"),
})
