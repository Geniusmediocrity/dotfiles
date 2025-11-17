vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.encoding = "utf-8"
vim.o.relativenumber = true
vim.o.number = true

-- Tabs options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "html", "css", "javascript", "typescript", "json", "jsonc" },
	callback = function()
		vim.opt.shiftwidth = 2 -- how many spaces when shifting (>>, <<, etc.)
		vim.opt.tabstop = 2 -- the width of the tab character (in spaces)
		vim.opt.softtabstop = 2 -- how many spaces when pressing tab (so that tab "feels" like 2 spaces)
	end,
})

vim.o.mouse = "a"
vim.o.mousemoveevent = true
vim.o.showmode = true
vim.opt.showcmd = true

vim.opt.swapfile = false

vim.opt.termguicolors = true

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Confirm dangerous operrations
vim.o.confirm = true

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Navic requiring
vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- VS Code-style blinking cursor with thin bar in insert mode
vim.opt.guicursor = {
	-- Normal, Visual, Command-line: block
	"n-v-c:block",
	-- Insert mode: thin vertical bar (25% width), blinking
	"i-ci-ve:ver25",
	-- Replace: horizontal line
	"r-cr:hor20",
	-- Operator-pending: thicker horizontal
	"o:hor50",
	-- All blinking: custom blink timing
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
	-- Special mode (like select)
	"sm:block-blinkwait175-blinkoff150-blinkon175",
}
