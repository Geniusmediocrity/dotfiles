-- Go Prev tab
vim.keymap.set("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Tab", silent = true })

-- Go Next tab
vim.keymap.set("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Tab", silent = true })

-- Close current tab
vim.keymap.set("n", "<A-c>", ":tabclose<CR><CR>", { desc = "Close current tab", silent = true })
