local fff = require("fff")

-- === Base (Files & Grep) ===
vim.keymap.set("n", "<leader><leader>", fff.find_files, { desc = "[S]earch [S]elect FFF" })
vim.keymap.set("n", "<leader>sf", fff.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sg", fff.live_grep, { desc = "[S]earch by [L]ive Grep" })

-- Searching the word below the cursor
vim.keymap.set("n", "<leader>sw", function()
	fff.live_grep({ query = vim.fn.expand("<cword>") })
end, { desc = "[S]earch [W]ord in project" })

-- Searching in all file(no dividing by opened buffer)
vim.keymap.set("n", "<leader>s/", fff.live_grep, { desc = "[S]earch [/] in Project" })
