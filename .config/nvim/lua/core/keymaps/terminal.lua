-- Toggleterm hide terminal
vim.keymap.set("i", "<-t><Esc>", 'exe v:count1 . "ToggleTerm"', { silent = true, desc = "Toggleterm hide terminal" })

-- Open terminal in float mode
vim.keymap.set(
	"n",
	"<C-f>",
	":ToggleTerm direction=float<CR>",
	{ silent = true, desc = "Open float toggleterm terminal" }
)
