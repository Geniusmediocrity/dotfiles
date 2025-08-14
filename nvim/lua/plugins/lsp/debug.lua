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
				local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
				require("dap-python").setup(path)
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
			desc = "Debug: Start/Continue",
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
			desc = "Debug: Step [I]nto",
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
			desc = "Debug: Step [O]ver",
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
			desc = "Debug: Step [O]ut",
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
			desc = "Debug: [s]ee last session result.",
		},
		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: [s]ee last session result.",
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

		require("dap-python").setup()
	end,
}
