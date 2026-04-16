-- Color Creator
vim.keymap.set("n", "<leader>cc", ":CccPick<CR>", { silent = true, desc = "[C]olor [C]reator" })
vim.keymap.set(
	"n",
	"<leader>ct",
	":CccHighlighterToggle<CR>",
	{ silent = true, desc = "[T]oggle [C]olor Creator Highligher" }
)
