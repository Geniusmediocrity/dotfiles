return {
	"doodleEsc/translator.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("translator").setup({
			-- Translation engine configuration
			translate_engine = {
				base_url = "https://neuroapi.host/v1",
				api_key = os.getenv("NEURO_API_KEY"),
				model = "gpt-5-mini",
				temperature = 0.8,
				streaming = true, -- Enable streaming translation
			},
			-- Language detection engine configuration
			detect_engine = {
				base_url = "https://neuroapi.host/v1",
				api_key = os.getenv("NEURO_API_KEY"),
				model = "gpt-5-mini",
			},
			-- UI configuration
			ui = {
				width = 0.8, -- Window width (80% of screen)
				height = 0.4, -- Window height (40% of screen)
				border = {
					style = "rounded",
					text = {
						top_source = " Source ",
						top_target = " Translation ",
						top_align = "center",
					},
				},
			},
			-- Translation settings
			proxy = nil, -- Set proxy if needed
			prompt = "Translate the following text from $SOURCE_LANG to $TARGET_LANG, you can use some explanations in the text, if the are necessary for a more complteteand accurate understanding of the meaning of words or topics(btw, you are translating this text for a beginner c++/python developer).:\n```$TEXT\n```",
			source_language = "auto", -- Set to "auto" for automatic detection
			target_language = "ru", -- Default target language
			-- Keymaps configuration
			keymaps = {
				enable = true,
				translate = "<leader>T", -- Translation shortcut in visual mode
			},
		})
	end,
}
