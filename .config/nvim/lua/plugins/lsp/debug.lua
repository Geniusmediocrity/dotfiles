return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",

		"nvim-neotest/nvim-nio",

		"mason-org/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		{
			"mfussenegger/nvim-dap-python",
			config = function()
				local function expand_path(path)
					return vim.fn.expand(path)
				end

				require("dap-python").setup(expand_path("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"))
			end,
		},
	},
	keys = {
		-- Basic debugging keymaps
		{
			"<F17>", -- Shift + F5
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<leader>dr",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue(Shift + F5)",
		},

		{
			"<F14>", -- Shift + F2
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step [I]nto",
		},
		{
			"<leader>di",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step [I]nto(Shift + F2)",
		},

		{
			"<F15>", -- Shift + F3
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step [O]ver",
		},
		{
			"<leader>dO",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step [O]ver(Shift + F3)",
		},

		{
			"<F13>", -- Shift + F1
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step [O]ut",
		},
		{
			"<leader>do",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step [O]ut(Shift + F1)",
		},

		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: toggle [b]reakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("breakpoint condition: "))
			end,
			desc = "Debug: set [b]reakpoint",
		},

		-- toggle to see last session result. without this, you can't see session output in case of unhandled exception.
		{
			"<leader>ds",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: [s]ee last session result.(F7)",
		},
		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: [s]ee last session result.",
		},

		-- close debuger
		{
			"<leader>dc",
			function()
				require("dapui").close()
			end,
			desc = "Debug: [C]lose DAP UI",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			-- makes a best effort to setup the various debuggers with
			-- reasonable debug configurations
			automatic_installation = true,

			-- you can provide additional configuration to the handlers,
			-- see mason-nvim-dap readme for more information
			handlers = {},

			ensure_installed = {
				"python",
			},
		})

		-- dap ui setup
		-- for more information, see |:help nvim-dap-ui|
		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					disconnect = "",
					pause = "⏸",
					play = "",
					run_last = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					terminate = "",
				},
			},
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.45 },
						{ id = "breakpoints", size = 0.15 },
						{ id = "stacks", size = 0.20 },
						{ id = "watches", size = 0.20 },
					},
					size = 40, -- ширина в символах (для вертикального окна)
					position = "left",
				},
				{
					elements = {
						{ id = "console", size = 0.5 },
						{ id = "repl", size = 0.5 },
					},
					size = 15, -- высота в строках (для горизонтального окна)
					position = "bottom",
				},
			},
		})

		-- change breakpoint icons
		vim.api.nvim_set_hl(0, "dapbreak", { fg = "#e51400" })
		vim.api.nvim_set_hl(0, "dapstop", { fg = "#ffa400" })

		local breakpoint_icons = {
			Breakpoint = "",
			BreakpointCondition = "",
			BreakpointRejected = "",
			LogPoint = "",
			Stopped = "",
		}
		for type, icon in pairs(breakpoint_icons) do
			local tp = "Dap" .. type
			local hl = (type == "Stopped") and "DapStop" or "DapBreak"
			vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
		end

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file (with .venv)",
				program = "${file}",
				pythonPath = function()
					-- Сhecking the existence .venv at the root of project
					local venv = vim.fn.getcwd() .. "/.venv"
					if vim.fn.executable(venv .. "/bin/python") == 1 then
						return venv .. "/bin/python"
					else
						-- fallback on global python
						return "python"
					end
				end,
				console = "integratedTerminal", -- very usefull to see d output
				justMyCode = true, -- If false very usefull to debug third-party code
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					-- Get filename without extension(i.e.: main.cpp -> main)
					local filename = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
					return "./build/debug/" .. filename .. ".elf"
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
	end,
}
