-- Easy color
vim.keymap.set("n", "<leader>ce", ":EasyColor<CR>", { silent = true, desc = "[Easy] [C]olor Picker" })

-- Color Creator
vim.keymap.set("n", "<leader>cc", ":CccPick<CR>", { silent = true, desc = "[C]olor [C]reator" })
vim.keymap.set(
	"n",
	"<leader>ct",
	":CccHighlighterToggle<CR>",
	{ silent = true, desc = "[T]oggle [C]olor Creator Highligher" }
)

-- Colorizer
vim.keymap.set(
	"n",
	"<leader>cT",
	":ColorizerToggle<CR>",
	{ silent = true, desc = "[C]olorizer [T]oggle (Highlighting)" }
)
