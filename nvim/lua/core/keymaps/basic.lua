-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = ' Open diagnostic [Q]uickfix list' })

-- Save file
vim.keymap.set('n', '<leader>sf', ':w<CR>', { desc = ' [S]ave [F]ile changes' })

-- Splitting
vim.keymap.set('n', '<leader>sv', '<C-w>v<Esc>', { desc = ' [S]plit [V]ertical' })
vim.keymap.set('n', '<leader>ss', '<C-w>s<Esc>', { desc = ' [S]plit Horizontal' })

-- Vim block mode activating
vim.keymap.set('n', '<leader>v', '<Cmd>execute "normal! <C-v>"<CR>', { desc = "󰷋 Enter [V]isual Block mode" })
