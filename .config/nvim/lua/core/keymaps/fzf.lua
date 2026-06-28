local fzf = require("fzf-lua")

-- === Base ===
vim.keymap.set("n", "<leader>sH", fzf.help_tags, { desc = "[S]earch [H]elp Tags" })
vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sd", fzf.diagnostics_workspace, { desc = "[S]earch [D]iagnostics (Workspace)" })
vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "[S]earch [R]esume Last Picker" })
vim.keymap.set("n", "<leader>sp", fzf.oldfiles, { desc = "[S]earch [P]reviously opened files" })
vim.keymap.set("n", "<leader>sb", fzf.buffers, { desc = "[S]earch Existing [B]uffers" })

-- === Git keymaps ===
vim.keymap.set("n", "<leader>sGb", fzf.git_branches, { desc = "[S]how All [G]it [B]ranches" })
vim.keymap.set("n", "<leader>sGc", fzf.git_commits, { desc = "[S]how All [G]it [C]ommits" })
vim.keymap.set("n", "<leader>sGs", fzf.git_stash, { desc = "[S]how All [G]it [S]tashes" })
vim.keymap.set("n", "<leader>sGf", fzf.git_files, { desc = "[S]how All [G]it [F]iles" })
vim.keymap.set("n", "<leader>sGt", fzf.git_status, { desc = "[S]how All [G]it S[t]atuses" })

-- === Code keymaps ===
vim.keymap.set("n", "<leader>sv", fzf.treesitter, { desc = "[S]how All Local [V]ariables (Treesitter)" })
vim.keymap.set("n", "<leader>ss", fzf.spell_suggest, { desc = "[S]earch [S]pell Suggests" })

-- === History keymaps ===
vim.keymap.set("n", "<leader>shs", fzf.search_history, { desc = "[S]earch [H]istory Searches" })
vim.keymap.set("n", "<leader>shc", fzf.quickfix_stack, { desc = "[S]earch [H]istory of [C]ommands (Quickfix)" })

vim.keymap.set("n", "<leader>/", function()
	fzf.blines({
		winopts = {
			height = 0.60,
			width = 0.50,
			row = 0.40,
			preview = {
				layout = "vertical",
				vertical = "down:0%",
				hidden = "hide",
			},
		},
	})
end, { desc = "[/] Fuzzily Search In Current Buffer" })

vim.keymap.set("n", "<leader>sn", function()
	fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
