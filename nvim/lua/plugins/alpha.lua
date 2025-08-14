return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		enabled = true,
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			-- Header Section
			local logo = [[
 ██████   █████              ███                 
░░██████ ░░███              ░░░                  
 ░███░███ ░███  █████ █████ ████  █████████████  
 ░███░░███░███ ░░███ ░░███ ░░███ ░░███░░███░░███ 
 ░███ ░░██████  ░███  ░███  ░███  ░███ ░███ ░███ 
 ░███  ░░█████  ░░███ ███   ░███  ░███ ░███ ░███ 
 █████  ░░█████  ░░█████    █████ █████░███ █████
░░░░░    ░░░░░    ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ 

                              by Geniusmediocrity
  ]]

			dashboard.section.header.val = vim.split(logo, "\n")
			dashboard.section.header.opts.hl = "AlphaHeader"
			vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#949ae4", bold = true })

			-- Buttons Section
			dashboard.section.buttons.val = {
				dashboard.button("f", " Find file", "<cmd>Telescope find_files <CR>"),
				dashboard.button("n", " New file", "<cmd>ene <BAR> startinsert <CR>"),
				dashboard.button("r", " Recent files", "<cmd>Telescope oldfiles <CR>"),
				dashboard.button("g", " Find text", "<cmd>Telescope live_grep <CR>"),
				dashboard.button(
					"c",
					" Config",
				"<cmd>edit $MYVIMRC <CR> <cmd>cd " .. vim.fn.stdpath("config").. " <CR>"
				),
				dashboard.button("l", "󰒲 Lazy", "<cmd> Lazy <cr>"),
				dashboard.button("m", " Mason", "<cmd> Mason <cr>"),
				dashboard.button("q", " Quit", "<cmd>q <CR>"),
			}
			dashboard.section.buttons.opts.hl = "AlphaButtons"

			-- Layout
			dashboard.opts.layout = {
				{ type = "padding", val = 4 }, -- Upper margin
				dashboard.section.header,
				{ type = "padding", val = 2 }, -- Space between logo and buttons
				dashboard.section.buttons,
				{ type = "padding", val = 1 }, -- Space between buttons and recent files
				dashboard.section.footer,
			}

			-- Lazy Loading
			if vim.o.filetype == "lazy" then
				vim.cmd.close()
				vim.api.nvim_create_autocmd("User", {
					once = true,
					pattern = "AlphaReady",
					callback = function()
						require("lazy").show()
					end,
				})
			end

			-- Set the dashbaord
			require("alpha").setup(dashboard.opts)

			-- Draw Footer After Startup
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

					-- Footer
					dashboard.section.footer.val = "⚡ Neovim loaded "
					.. stats.loaded
					.. "/"
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
					pcall(vim.cmd.AlphaRedraw)
					dashboard.section.footer.opts.hl = "AlphaFooter"
				end,
			})
		end,
	},
}
