return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	event = "VeryLazy",

	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- list of formatters & linters for mason to install
		require("mason-null-ls").setup({
			ensure_installed = {
				"prettier", -- ts/js formatter
				"stylua", -- lua formatter
				"shfmt", -- shell script formatter
				"ruff", -- python formatter
			},
			-- auto-install configured formatters & linters (with null-ls)
			automatic_installation = true,
			handlers = {},
		})

		local sources = {
			formatting.prettier,
			formatting.stylua,
			formatting.shfmt.with({ args = { "-i", "4" } }),
			require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
			require("none-ls.formatting.ruff_format"),
			formatting.clang_format.with({ args = { "-style=~/.clang-format" } }),
			formatting.cmake_format,
			formatting.asmfmt, -- asembler
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = sources,
			-- you can reuse a shared lspconfig on_attach callback here
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.cmd("silent! %s/\\r//g")
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		-- Define a custom :Format command
		vim.api.nvim_create_user_command("Format", function()
			vim.lsp.buf.format({ async = false })
		end, { desc = "Format current buffer using LSP" })
	end,
}
