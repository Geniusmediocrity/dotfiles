-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Save file
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = '[S]ave file changes' })
-- Copy highlited text
vim.keymap.set('v', '<C-c>', 'y', { desc = '[C]opy highlited text' })
-- Paste copied text
vim.keymap.set('n', '<C-v>', 'p', { desc = 'Paste copied text(basic)' })

-- Splitting
vim.keymap.set('n', '<leader>sv', '<C-w>v<Esc>', { desc = '[S]plit [V]ertical' })
vim.keymap.set('n', '<leader>ss', '<C-w>s<Esc>', { desc = '[S]plit Horizontal' })

-- Escape on jk
vim.keymap.set({ "n", "v", "i" }, "jk", '<Esc>', { desc = "Escape on jk" })
