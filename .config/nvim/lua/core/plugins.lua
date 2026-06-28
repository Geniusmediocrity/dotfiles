local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
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

	-- Yazi
	require("plugins.yazi"),

	-- Git signs helper
	require("plugins.gitsigns"),

	-- Fuzzy Finder
	require("plugins.fzf"),

	-- fff.nvim
	require("plugins.fff"),

	-- Bufferline -- turns buffers(on the top of the screen in nvim) to tabs
	require("plugins.bufferline"),

	-- TreeSiteer
	require("plugins.treesitter"),

	-- Theme
	require("plugins.themes"),

	-- Blink.cmp Nvim
	require("plugins.blink_cmp"),

	-- Lualine configuration
	require("plugins.lualine"),

	-- Fast code navigating
	require("plugins.flush"),

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
	require("plugins.indentscope"),

	-- Better Inline diagnostics
	require("plugins.inline_diagnostics"),

	-- Neovim Terminal
	require("plugins.terminal"),

	-- Uv in neovim -- the best plug for python coding, especially in combination with compiler
	require("plugins.uv"),

	-- General framework for context aware hover providers
	require("plugins.hover"),

	-- LSP and other good stuff for vibe coding
	require("plugins.lsp"),
})
