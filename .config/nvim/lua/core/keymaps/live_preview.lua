vim.keymap.set("n", "<leader>Ls", ":LivePreview start<CR>", { silent = true, desc = "[L]ive Preview [S]tart" })
vim.keymap.set("n", "<leader>Lc", ":LivePreview close<CR>", { silent = true, desc = "[L]ive Preview [C]lose" })
vim.keymap.set("n", "<leader>Lp", ":LivePreview pick<CR>", { silent = true, desc = "[L]ive Preview [P]ick file" })
vim.keymap.set("n", "<leader>Lh", ":help LivePreview<CR>", { silent = true, desc = "[L]ive Preview [H]elp" })
vim.keymap.set("n", "<leader>Lp", ":LivePreview pick<CR>", { silent = true, desc = "[L]ive Preview [P]ick" })

vim.keymap.set("n", "<leader>Mp", ":MarkdownPreview<CR>", { silent = true, desc = "[M]arkdown [P]review" })
vim.keymap.set("n", "<leader>Mt", ":MarkdownPreviewToggle<CR>", { silent = true, desc = "[M]arkdown [T]oggle" })
vim.keymap.set("n", "<leader>Ms", ":MarkdownPreviewStop<CR>", { silent = true, desc = "[M]arkdown [S]top" })
