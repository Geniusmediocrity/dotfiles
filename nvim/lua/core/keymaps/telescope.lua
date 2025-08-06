-- See `:help telescope.builtin`

-- Basic keymaps
local builtin = require('telescope.builtin')

-- === Base ===
vim.keymap.set('n', '<leader><leader>', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sH', builtin.help_tags, { desc = '[S]earch [H]elp Tags' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch [W]ord in current file' })
vim.keymap.set('n', '<leader>sG', builtin.live_grep, { desc = '[S]earch by [L]ive Grep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume Last Picker' })
vim.keymap.set('n', '<leader>sp', builtin.oldfiles, { desc = '[S]earch [P]reviously opened files' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch Existing [B]uffers' })

-- === Git keymaps ===
vim.keymap.set('n', '<leader>sgb', builtin.git_branches, { desc = "[S]how All [G]it [B]ranches" })
vim.keymap.set('n', '<leader>sgc', builtin.git_commits, { desc = "[S]how All [G]it [C]ommits" })
vim.keymap.set('n', '<leader>sgs', builtin.git_stash, { desc = "[S]how All [G]it [S]tashes" })
vim.keymap.set('n', '<leader>sgf', builtin.git_files, { desc = "[S]how All [G]it [F]iles" })
vim.keymap.set('n', '<leader>sgt', builtin.git_status, { desc = "[S]how All [G]it S[t]atuses" })

-- === Code keymaps ===
vim.keymap.set('n', '<leader>sv', builtin.treesitter, { desc = "[S]how All Local [V]ariables" })
vim.keymap.set('n', '<leader>ss', builtin.spell_suggest, { desc = '[S]earch [S]pell Suggests' })

-- === History keymaps ===
vim.keymap.set('n', '<leader>shs', builtin.search_history, { desc = '[S]earch [H]istroy [S]earches' }) -- Seacrh History of recently searches
vim.keymap.set('n', '<leader>shc', builtin.quickfixhistory, { desc = '[S]earch [H]istory of [C]ommands' })

-- === Loaded buffers searchers ===
-- Search in current loaded buffer(file)
vim.keymap.set('n', '<leader>/', function()
	builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    	winblend = 10,
    	previewer = false,
	})
end, { desc = '[/] Fuzzily Search In Current Buffer' })

--  See `:help telescope.builtin.live_grep()` for information about particular keys
--  Seacrh in current buffers(files)
vim.keymap.set('n', '<leader>s/', function()
	builtin.live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end, { desc = '[S]earch [/] in Open Buffers' })

-- === Ypur Neo Vim config searcher ===
-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
	builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
