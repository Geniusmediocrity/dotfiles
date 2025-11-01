-- === Miscellaneous keymaps ===
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = " Open diagnostic [Q]uickfix list" })

-- Save file
vim.keymap.set("n", "<leader>sf", ":w<CR>", { desc = " [S]ave [F]ile changes" })

-- === Windows ===
-- Creating / splitting
vim.keymap.set("n", "<leader>wv", "<C-w>v<Esc>", { desc = " Split [Window] [V]ertical" })
vim.keymap.set("n", "<leader>ws", "<C-w>s<Esc>", { desc = " Split [W]indow in a [S]outh" })
vim.keymap.set("n", "<leader>wn", "<C-w>n", { desc = " Create [N]ew [W]indow in a South" })

-- Moving
vim.keymap.set("n", "<leader>wl", "<C-w>L", { desc = " Move [W]indow in a Right" })
vim.keymap.set("n", "<leader>wk", "<C-w>K", { desc = " Move [W]indow in a Top" })
vim.keymap.set("n", "<leader>wj", "<C-w>J", { desc = " Move [W]indow in a Bottom" })
vim.keymap.set("n", "<leader>wh", "<C-w>H", { desc = " Move [W]indow in a Left" })

-- Manipulating
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "󰱝 Close All [W]indow Except Current" })
vim.keymap.set("n", "<leader>w+", "<C-w>+", { desc = " Increase [W]indow Size" })
vim.keymap.set("n", "<leader>w-", "<C-w>-", { desc = " Decrease [W]indow Size" })

-- === Custom Modes ===
-- Vim block mode activating
vim.keymap.set("n", "<leader>v", '<Cmd>execute "normal! <C-v>"<CR>', { desc = "󰷋 Enter [V]isual Block mode" })

-- Format buffer keymaps
vim.keymap.set("n", "<leader>f", ":Format<CR>", { silent = true, desc = "Format buffer" })

-- Toggleterm hide terminal
vim.keymap.set("i", "<-t><Esc>", 'exe v:count1 . "ToggleTerm"', { silent = true, desc = "Format buffer" })
