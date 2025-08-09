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

	-- Telescope (Fuzzy Finder)
	require('plugins.telescope'),

	-- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.
	require('plugins.trouble'),

	-- Bufferline -- turns buffers(on the top of the screen in nvim) to tabs
	require('plugins.bufferline'),

	-- TreeSiteer
	require('plugins.treesitter'),

	-- Theme
	require('plugins.themes.cattpuccin'),

	-- Vim Tmux Navigator
	require('plugins.vim_tmux_navigator'),

	-- CMP Nvim
	require('plugins.nvim_cmp'),

	-- Lualine configuration
	require('plugins.lualine'),

	-- Colorizer for preview color
	require('plugins.colorizer'),

	-- Color picker to pick the colors
	require('plugins.color_picker'),
	require('plugins.easycolor'),

	-- Comments
	require('plugins.comments'),

	-- Highlight todo, notes, etc in comments
	require('plugins.todo'),

	-- Which-key- Useful plugin to show you pending keybinds.
	require('plugins.which_key'),

	-- Noice = Nice, Noise, Notice
	require('plugins.noice'),

	-- LSP
	require('plugins.lsp.lspconfig'),

	--Indential gides
	require('plugins.ibl'),

})
