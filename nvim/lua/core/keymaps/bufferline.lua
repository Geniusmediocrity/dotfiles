-- Go Prev tab
vim.keymap.set('n', '<A-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous Tab' })
vim.keymap.set('n', '<A-j>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Previous Tab' })

-- Go Next tab
vim.keymap.set('n', '<A-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next Tab' })
vim.keymap.set('n', '<A-k>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Next Tab' })

-- Go to tabs by number
for n = 1, 9 do
	vim.keymap.set('n', '<leader>g' .. n, function()
    	vim.cmd(tostring(n) .. 'tabnext')
	end, { desc = "[G]o To [" .. n .. "] Tab" })
end

-- Close current tab
vim.keymap.set('n', '<A-c>', ':tabclose<CR><CR>', { desc = 'Close current tab' })
