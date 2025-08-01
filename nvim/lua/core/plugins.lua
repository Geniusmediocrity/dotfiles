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

	-- LSP
	require('plugins.lsp.lspconfig'),

})
