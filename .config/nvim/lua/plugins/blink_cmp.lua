return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 1. Keymaps
		keymap = {
			preset = "none", -- Отключаем стандартные, чтобы ничего не конфликтовало
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<CR>"] = { "accept", "fallback" }, -- подтвердить только если выбрано руками
			["<Tab>"] = { "select_and_accept", "fallback" }, -- выбрать первое и подтвердить
		},

		-- 2. Appearence
		completion = {
			accept = {
				-- working like a nvim-autopairs
				auto_brackets = { enabled = true },
			},
			menu = {
				border = "rounded",
				-- Columns menu configuring in lspkind style (Icon + Text)
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 } },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = { border = "rounded" },
			},
		},

		-- 3. Autocompletion sources
		sources = {
			-- Built-in analogues of: cmp-lsp, cmp-async-path, cmp_luasnip, cmp-buffer
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- 4. cmdline support
		-- built-in in blink
		cmdline = {
			enabled = true,
		},

		-- 5. Icons and Snippets
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		snippets = {
			preset = "default", -- built-in LuaSnip analogue
		},
	},
	build = function()
		require("blink.cmp").build():pwait()
	end,
}
