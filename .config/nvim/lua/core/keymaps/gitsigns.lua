vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { silent = true, desc = "[G]itsigns [P]review hunk" })
vim.keymap.set(
	"n",
	"<leader>gi",
	":Gitsigns preview_hunk_inline<CR>",
	{ silent = true, desc = "[G]itsigns Preview [I]nline hunk" }
)

vim.keymap.set(
	"n",
	"<leader>gB",
	":Gitsigns toggle_current_line_blame<CR>",
	{ silent = true, desc = "[G]itsigns Toggle [I]nline [B]lame" }
)
vim.keymap.set("n", "<leader>gb", ":Gitsigns blame<CR>", { silent = true, desc = "[G]itsigns [B]lame" })
