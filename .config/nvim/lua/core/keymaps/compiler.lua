-- Open compiler on Shift + F10
vim.api.nvim_set_keymap('n', '<F22>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
-- ??? And clean thr history ???
vim.api.nvim_set_keymap('n', '<F6>',
     "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
 { noremap = true, silent = true })

-- Toggle compiler results on Shift + F9
vim.api.nvim_set_keymap('n', '<F21>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
