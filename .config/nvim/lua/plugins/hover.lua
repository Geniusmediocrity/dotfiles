return {
	"lewis6991/hover.nvim",
	config = function()
		require("hover").config({
			providers = {
				"hover.providers.diagnostic",
				"hover.providers.dap",
				"hover.providers.lsp",
				"hover.providers.dictionary",
				"hover.providers.man",
				"hover.providers.gh",
				"hover.providers.gh_user",
				"hover.providers.fold_preview",
			},
			preview_opts = {
				border = "single",
			},
		})

		vim.keymap.set("n", "K", function()
			require("hover").open()
		end, { desc = "hover.nvim (open)" })

		vim.keymap.set("n", "gK", function()
			require("hover").enter()
		end, { desc = "hover.nvim (enter)" })

		vim.keymap.set("n", "<MouseMove>", function()
			require("hover").mouse()
		end, { desc = "hover.nvim (mouse)" })

		vim.keymap.set("n", "<C-p>", function()
			require("hover").switch("previous")
		end, { desc = "hover.nvim (previous source)" })

		vim.keymap.set("n", "<C-n>", function()
			require("hover").switch("next")
		end, { desc = "hover.nvim (next source)" })

		vim.o.mousemoveevent = true
	end,
}
