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
	'NMAC427/guess-indent.nvim',

	-- NeoTree configuration
	require('plugins.neotree'),

	-- Git signs helper
	require('plugins.gitsigns'),

	-- Telescope (Fuzzy Finder)
	require('plugins.telescope'),

	-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
	require('plugins.trouble'),

	-- Bufferline -- turns buffers(on the top of the screen in nvim) to tabs
	require('plugins.bufferline'),

	-- TreeSiteer
	require('plugins.treesitter'),

	-- Theme
	require('plugins.themes'),

	-- Smooth cursor animate
	require('plugins.cursor_animate'),

	-- Vim Tmux Navigator
	require('plugins.vim_tmux_navigator'),

	-- CMP Nvim
	require('plugins.cmp'),

	-- Lualine configuration
	require('plugins.lualine'),

	-- Urls opener
	require('plugins.url_open'),

	-- Colorizer for preview color
	require('plugins.colorizer'),

	-- Color picker to pick the colors
	require('plugins.color_picker'),
	require('plugins.easycolor'),

	-- Comments
	-- Highlight todo, notes, etc in comments
	require('plugins.comments'),

	-- Live preview is the same live server
	require('plugins.live_preview'),

	-- Which-key- Useful plugin to show you pending keybinds.
	require('plugins.which_key'),

	-- Noice = Nice, Noise, Notice
	require('plugins.noice'),

	-- Indential guides
	require('plugins.ibl'),

	-- Better Inline diagnostics
	require('plugins.inline_diagnostics'),

	-- Start menu
	require('plugins.alpha'),

	-- Sessions
	require('plugins.sessions'),

	-- Like cd, but cooler
	require('plugins.zoxide'),

	-- Uv in neovim -- the best plug for python coding, especially in combination with compiler
	require('plugins.uv'),

	-- Compiler for code
	require('plugins.compiler'),

	-- Neovim htop
	require('plugins.htop'),

	-- LSP and other good stuff for vibe coding
	require('plugins.lsp'),

	{
  'aaronik/treewalker.nvim',

  -- The following options are the defaults.
  -- Treewalker aims for sane defaults, so these are each individually optional,
  -- and setup() does not need to be called, so the whole opts block is optional as well.
  opts = {
    -- Whether to briefly highlight the node after jumping to it
    highlight = true,

    -- How long should above highlight last (in ms)
    highlight_duration = 250,

    -- The color of the above highlight. Must be a valid vim highlight group.
    -- (see :h highlight-group for options)
    highlight_group = 'CursorLine',

    -- Whether to create a visual selection after a movement to a node.
    -- If true, highlight is disabled and a visual selection is made in
    -- its place.
    select = false,

    -- Whether the plugin adds movements to the jumplist -- true | false | 'left'
    --  true: All movements more than 1 line are added to the jumplist. This is the default,
    --        and is meant to cover most use cases. It's modeled on how { and } natively add
    --        to the jumplist.
    --  false: Treewalker does not add to the jumplist at all
    --  "left": Treewalker only adds :Treewalker Left to the jumplist. This is usually the most
    --          likely one to be confusing, so it has its own mode.
    jumplist = true,
  }
}
})
