local map = vim.keymap.set

map("n", "gx", ":URLOpenUnderCursor<CR>", { silent = true, desc = "Open File Path or URL" })
