return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo", "Format" },
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- 1. Installing formatters via Mason
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier", -- ts/js/html/css formatter
				"stylua", -- lua formatter
				"shfmt", -- shell script formatter
				"ruff", -- python formatter
				"clang-format", -- c/c++ formatter
				"cmakelang", -- cmake-format
				-- "asmfmt", -- assembler
			},
		})

		local conform = require("conform")

		-- 2. Main config for Conform
		conform.setup({
			-- Linking formatter for a certain file types
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },

				lua = { "stylua" },

				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },

				-- For Ruff, causing an import sorting at first
				--	(analogue to --extend-select I (null-ls like)),
				--	and then the formatting itself
				python = { "ruff_organize_imports", "ruff_format" },

				c = { "clang_format" },
				cpp = { "clang_format" },
				cmake = { "cmake_format" },

				asm = { "asmfmt" },

				-- Fallback для всех остальных типов файлов: использовать LSP
				["_"] = { "trim_whitespace" },
			},

			-- 3. Configuring the formatting on save
			format_on_save = function(bufnr)
				-- For remove \r (Windows carriage returns).
				vim.cmd("silent! keeppatterns keepjumps %s/\\r//g")

				return {
					timeout_ms = 2000,
					lsp_format = "fallback", -- if there no external formatter, it uses LSP(e.g.: rust_analyzer)
				}
			end,

			-- 4. Passing custom arguments to formatters (similar to `.with({ args = ... })` )
			formatters = {
				shfmt = {
					prepend_args = { "-i", "4" },
				},
				clang_format = {
					prepend_args = { "-style=~/.clang-format" },
				},
				-- ruff_organize_imports & ruff_format are already configured "out of the box"
			},
		})

		-- 5. Custom command :Format
		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			-- Conform supports a visual mode for the Format command
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			conform.format({ async = true, lsp_format = "fallback", range = range })
		end, { range = true, desc = "Format current buffer using Conform" })
	end,
}
